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
    "lua_ls",
    "rust_analyzer",
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
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
    })

    return
  end

  if server.name == "tailwindcss" then
    config.on_attach = function(client, bufnr)
      require("tailwind-highlight").setup(client, bufnr, {
        single_column = false,
        mode = "background",
        debounce = 200,
      })
    end
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

-- Show inline diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

-- Shows progress of the current LSP server in the bottom right hand corner
require("fidget").setup()
