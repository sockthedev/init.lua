local u = require("utils.keymaps")

---@param bufnr integer
local function setup_basic_keymap(bufnr)
  local opts = { buffer = bufnr }

  u.set_keymaps("n", {
    { "gD", vim.lsp.buf.declaration, "Goto declaration" },
    { "gd", vim.lsp.buf.definition, "Goto definition" },
    { "gI", vim.lsp.buf.implementation, "Goto implementation" },
    { "gt", vim.lsp.buf.type_definition, "Goto type definition" },
    { "gs", require("telescope.builtin").lsp_document_symbols, "Document symbols" },
    { "gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols" },
  }, opts)
end

return setup_basic_keymap
