local mods = require("plugins.lsp.mods")
local mason_lsp = require("mason-lspconfig")

-- this MUST be called prior to any `require("lspconfig")`
require("neodev").setup({})

mason_lsp.setup({
  ensure_installed = {
    "astro",
    "bashls",
    "cssls",
    "emmet_ls",
    "graphql",
    "html",
    "jsonls",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
    "vimls",
    "yamlls",
  },
})

local function default_on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  mods.setup_basic_keymap(bufnr)
  mods.setup_format_keymap(client, bufnr)
  mods.setup_format_on_save(client, bufnr)
  mods.setup_document_highlight(client, bufnr)
end

local function make_config()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  return {
    capabilities = capabilities,
    on_attach = default_on_attach,
  }
end

local function setup_server(server)
  local config = make_config()

  if server.name == "emmet_ls" then
    config.filetypes = { "html", "css", "scss" }
  end

  if server.name == "sumneko_lua" then
    config.settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    }
  end

  if server.name == "jsonls" then
    config.settings = {
      json = {
        ---@diagnostic disable-next-line: missing-parameter
        schemas = vim.list_extend({
          {
            description = "Setting of sumneko.lua",
            fileMatch = { ".luarc.json" },
            name = ".luarc.json",
            url = "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
          },
        }, require("schemastore").json.schemas()),
        validate = { enable = true },
      },
    }
  end

  if server.name == "tsserver" then
    require("typescript").setup({
      server = {
        capabilities = config.capabilities,
        on_attach = function(client, bufnr)
          default_on_attach(client, bufnr)

          vim.api.nvim_buf_create_user_command(bufnr, "OI", function(opts)
            require("typescript").actions.organizeImports({ sync = opts.bang })
          end, { desc = "Organize Imports", bang = true })
        end,
        root_dir = require("lspconfig").util.root_pattern(".git"),
      },
    })

    return
  end

  server.setup(config)
end

for _, server_name in ipairs(mason_lsp.get_installed_servers()) do
  setup_server(require("lspconfig")[server_name])
end

vim.api.nvim_create_user_command("Format", function(params)
  local format = require("plugins.lsp.utils.format")
  if params.range > 0 then
    format({ range = vim.lsp.util.make_given_range_params() })
  else
    format()
  end
end, { desc = "Format", range = "%" })

local function setup_diagnostics()
  vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = true,
  })

  vim.schedule(function()
    for _, severity in ipairs({ "Error", "Warn", "Info", "Hint" }) do
      local hl_def = vim.api.nvim_get_hl_by_name("Diagnostic" .. severity, true)
      vim.api.nvim_set_hl(0, "DiagnosticLineNr" .. severity, { fg = hl_def.foreground, bold = true })
      vim.fn.sign_define("DiagnosticSign" .. severity, { numhl = "DiagnosticLineNr" .. severity })
    end
  end)
end

setup_diagnostics()

require("fidget").setup()
