local u = require("utils.keymaps")

---@param bufnr integer
local function setup_basic_keymap(bufnr)
  local opts = { buffer = bufnr }

  u.set_keymaps("n", {
    { "gD", vim.lsp.buf.declaration, "[lsp] Goto declaration" },
    { "gd", vim.lsp.buf.definition, "[lsp] Goto definition" },
    { "gI", vim.lsp.buf.implementation, "[lsp] Goto implementation" },
    { "gt", vim.lsp.buf.type_definition, "[lsp] Goto type definition" },
    { "gs", require("telescope.builtin").lsp_document_symbols, "[lsp] Document symbols" },
    { "gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[lsp] Workspace symbols" },
  }, opts)
end

return setup_basic_keymap
