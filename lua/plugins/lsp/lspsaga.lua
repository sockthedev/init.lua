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
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    border = "single",
    winblend = 10,
  },
})

vim.keymap.set("n", "gk", ":Lspsaga hover_doc<CR>", { desc = "Show documentation", noremap = true, silent = true })
vim.keymap.set(
  "n",
  "gK",
  ":Lspsaga hover_doc ++keep<CR>",
  { desc = "Show documentation (and keep visible)", noremap = true, silent = true }
)
vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { desc = "References", noremap = true, silent = true })
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek", noremap = true, silent = true })
vim.keymap.set("n", "gI", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming calls", noremap = true, silent = true })
vim.keymap.set("n", "gO", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing calls", noremap = true, silent = true })

-- code actions
local codeaction = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", function()
  codeaction:code_action()
end, { desc = "Code Action", silent = true })
vim.keymap.set("v", "<leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { desc = "Code Action", silent = true })
vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info", noremap = true, silent = true })
vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { desc = "Rename", silent = true })
vim.keymap.set(
  "n",
  "<leader>co",
  "<cmd>Lspsaga outline<CR>",
  { desc = "Toggle code outline", noremap = true, silent = true }
)

-- diagnostics
vim.keymap.set(
  "n",
  "<leader>xl",
  "<cmd>Lspsaga show_line_diagnostics<CR>",
  { desc = "Line diagnostics", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>xc",
  "<cmd>Lspsaga show_cursor_diagnostics<CR>",
  { desc = "Cursor diagnostics", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>xb",
  "<cmd>Lspsaga show_buffer_diagnostics<CR>",
  { desc = "Cursor diagnostics", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "[d",
  "<cmd>Lspsaga diagnostic_jump_prev<CR>",
  { desc = "Prev Diagnostic", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "]d",
  "<cmd>Lspsaga diagnostic_jump_next<CR>",
  { desc = "Next Diagnostic", noremap = true, silent = true }
)
vim.keymap.set("n", "[e", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev Error", noremap = true, silent = true })
vim.keymap.set("n", "]e", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error", noremap = true, silent = true })
vim.keymap.set("n", "[w", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARNING })
end, { desc = "Prev Warning", noremap = true, silent = true })
vim.keymap.set("n", "]w", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARNING })
end, { desc = "Next Warning", noremap = true, silent = true })
