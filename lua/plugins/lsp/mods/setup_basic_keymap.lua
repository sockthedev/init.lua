local u = require("utils.keymaps")
local hover = require("plugins.lsp.utils.hover")

---@param client table
---@param bufnr integer
local function setup_basic_keymap(client, bufnr)
  local opts = { buffer = bufnr }

  u.set_keymaps("n", {
    { "<leader>rn", vim.lsp.buf.rename, "[lsp] rename" },
    { "gD", vim.lsp.buf.declaration, "[lsp] declaration" },
    { "gd", vim.lsp.buf.definition, "[lsp] definition" },
    {
      "K",
      function()
        hover(client.offset_encoding)
      end,
      "[lsp] hover",
    },
    { "gi", vim.lsp.buf.implementation, "[lsp] implementation" },
    { "<C-k>", vim.lsp.buf.signature_help, "[lsp] signature help", mode = { "n", "i" } },
    { "gy", vim.lsp.buf.type_definition, "[lsp] type definition" },
    { "gr", vim.lsp.buf.references, "[lsp] references" },
    { "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[lsp] document symbols" },
    { "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[lsp] workspace symbols" },
    { "<Leader>ca", vim.lsp.buf.code_action, "[lsp] code action", mode = { "n", "v" } },
    {
      "<Leader>do",
      function()
        vim.diagnostic.open_float({ scope = "line" })
      end,
      "[lsp] show line diagnostic",
    },
    { "[d", vim.diagnostic.goto_prev, "[lsp] prev diagnostic" },
    { "]d", vim.diagnostic.goto_next, "[lsp] next diagnostic" },
    { "<Leader>qf", vim.diagnostic.setloclist, "[lsp] diagnostic to location list" },
    { "<Leader>rs", "<cmd>LspRestart<CR>", "[lsp] restart" },
  }, opts)
end

return setup_basic_keymap
