local u = require("utils.keymaps")

---@param bufnr integer
local function setup_basic_keymap(bufnr)
  local opts = { buffer = bufnr }

  u.set_keymaps("n", {
    { "gd", vim.lsp.buf.definition, "Goto Definition" },
    { "gD", vim.lsp.buf.declaration, "Goto Declaration" },
    { "gI", "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
    { "gt", "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
    { "gK", vim.lsp.buf.signature_help, "Signature Help" },
  }, opts)
end

return setup_basic_keymap
