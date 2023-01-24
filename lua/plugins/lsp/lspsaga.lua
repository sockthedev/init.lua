require("lspsaga").setup({
  lightbulb = {
    virtual_text = false,
  },
  show_outline = {
    win_position = "right",
    win_width = 40,
    keys = {
      jump = "o",
      expand_collapse = "u",
      quit = "q",
    },
  },
  ui = {
    border = "single",
    winblend = 10,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })

vim.keymap.set("n", "gk", ":Lspsaga hover_doc<CR>", { desc = "Show documentation" })
vim.keymap.set("n", "gK", ":Lspsaga hover_doc ++keep<CR>", { desc = "Show documentation (and keep visible)" })
vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { desc = "References" })
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek" })
vim.keymap.set("n", "gI", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming calls" })
vim.keymap.set("n", "gO", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing calls" })
vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { desc = "Rename" })
vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outline<CR>", { desc = "Toggle code outline" })
vim.keymap.set("n", "<leader>xl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>xc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Cursor diagnostics" })
vim.keymap.set("n", "<leader>xb", "<cmd>Lspsaga show_buffer_diagnostics<CR>", { desc = "Cursor diagnostics" })
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
vim.keymap.set("n", "[e", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev Error" })
vim.keymap.set("n", "]e", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })
vim.keymap.set("n", "[w", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARNING })
end, { desc = "Prev Warning" })
vim.keymap.set("n", "]w", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARNING })
end, { desc = "Next Warning" })
