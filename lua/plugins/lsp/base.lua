-- this MUST be called prior to any `require("lspconfig")`
require("neodev").setup({})

local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason_lsp.setup({
  ensure_installed = {
    "astro",
    "cssls",
    "emmet_ls",
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

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 8000 })
    end,
  })
end

local function default_on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- TODO: Remove this and use standard key mapping
  local u = require("utils.keymaps")

  local opts = { buffer = bufnr }

  u.set_keymaps("n", {
    { "gd", vim.lsp.buf.definition,                    "Goto Definition" },
    { "gD", vim.lsp.buf.declaration,                   "Goto Declaration" },
    { "gI", "<cmd>Telescope lsp_implementations<cr>",  "Goto Implementation" },
    { "gt", "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
    { "gK", vim.lsp.buf.signature_help,                "Signature Help" },
  }, opts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.astro.setup({
  on_attach = default_on_attach,
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  on_attach = default_on_attach,
  capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
  filetypes = { "html", "css", "scss" },
  on_attach = default_on_attach,
  capabilities = capabilities,
})

lspconfig.html.setup({
  on_attach = default_on_attach,
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  settings = {
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
  },
  on_attach = default_on_attach,
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    default_on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  -- settings = {
  -- 	Lua = {
  -- 		diagnostics = {
  -- 			-- Get the language server to recognize the `vim` global
  -- 			globals = { "vim" },
  -- 		},
  -- 		workspace = {
  -- 			-- Make the server aware of Neovim runtime files
  -- 			library = vim.api.nvim_get_runtime_file("", true),
  -- 			checkThirdParty = false,
  -- 		},
  -- 	},
  -- },
  capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
  on_attach = default_on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  on_attach = default_on_attach,
  capabilities = capabilities,
})

lspconfig.tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
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
  on_attach = function(client, bufnr)
    default_on_attach(client, bufnr)

    vim.api.nvim_buf_create_user_command(bufnr, "OI", function(opts)
      require("typescript").actions.organizeImports({ sync = opts.bang })
    end, { desc = "Organize Imports", bang = true })
  end,
  capabilities = capabilities,
})

lspconfig.vimls.setup({
  on_attach = default_on_attach,
  capabilities = capabilities,
})

lspconfig.yamlls.setup({
  on_attach = default_on_attach,
  capabilities = capabilities,
})

vim.api.nvim_create_user_command("Format", function(params)
  if params.range > 0 then
    vim.lsp.buf.format({ range = vim.lsp.util.make_given_range_params(), timeout = 8000 })
  else
    vim.lsp.buf.format({ bufnr = params.bufnr, timeout = 8000 })
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
