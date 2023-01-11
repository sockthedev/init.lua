local u = require("utils.keymaps")

---@param bufnr integer
local function setup_basic_keymap(bufnr)
  local opts = { buffer = bufnr }

  u.set_keymaps("n", {
    { "<leader>lD", vim.lsp.buf.declaration, "Goto declaration" },
    { "<leader>ld", vim.lsp.buf.definition, "Goto definition" },
    { "<leader>li", vim.lsp.buf.implementation, "Goto implementation" },
    { "<leader>ly", vim.lsp.buf.type_definition, "Goto type definition" },
    { "<leader>lr", vim.lsp.buf.references, "References" },
    { "<leader>td", require("telescope.builtin").lsp_document_symbols, "Document symbols" },
    { "<leader>tw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols" },
    { "<Leader>lr", "<cmd>LspRestart<CR>", "Restart" },
  }, opts)
end

return setup_basic_keymap
