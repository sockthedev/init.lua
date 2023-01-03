-- safely import lspconfig
local status, lspconfig = pcall(require, "lspconfig")
if not status then
  return
end

-- safely import neodev
local status3, neodev = pcall(require, "neodev")
if not status3 then
  return
end

-- configure neodev
neodev.setup({})

-- configure LSP

local protocol = require("vim.lsp.protocol")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- TODO: use vim.keymap.set
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<C-j>", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

protocol.CompletionItemKind = {
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Configure the language servers below, these are installed/managed via
-- Mason. Make sure that you have the necessary language servers installed.
-- Run `:Mason` to get the interactive Mason UI.

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwind server
lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- configure json server
lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure yaml server
lspconfig["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure xml server
lspconfig["lemminx"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure markdown server
lspconfig["remark_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure deno server
lspconfig.denols.setup({
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

-- configure typescript server
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  -- filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
  root_dir = lspconfig.util.root_pattern("package.json"),
})

-- configure lua server
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

-- configure graphql server
lspconfig.graphql.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

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
