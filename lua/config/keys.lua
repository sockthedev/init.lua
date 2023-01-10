local k = require("utils.keymaps")

k.set_keymaps({ "n", "v" }, {
  { "<Space>", "<Nop>", "Noop" },
})

k.set_keymaps("n", {
  { "<leader>w", ":w<CR>", "Save file" },
  { "x", '"_x', "Delete character" },
  { "<leader>fx", ":nohl<CR>", "Clear search highlighting" },
  { "<C-d>", "<C-d>zz", "Page down" },
  { "<C-u>", "<C-u>zz", "Page up" },
  { "n", "nzz", "Next search result" },
  { "N", "Nzz", "Previous search result" },
  { "<leader>L", "yyP", "Duplicate line up" },
  { "<leader>O", "O<Esc>", "Insert empty line above" },
  { "<leader>Q", ":qa<CR>", "Close all buffer/pane" },
  { "<leader>j", "ddp", "Move line up" },
  { "<leader>k", "ddkP", "Move line down" },
  { "<leader>l", "yyp", "Duplicate line down" },
  { "<leader>p", '"_dP', "Delete selection, pasting over contents, but keep paste register" },
  { "<leader>o", "o<Esc>", "Insert empty line below" },
  { "<leader>q", ":q<CR>", "Close buffer/pane" },
  { "<leader>se", "<C-w>=", "Make splits equal size" },
  { "<leader>sh", "<C-w>s", "Split horizontally" },
  { "<leader>sv", "<C-w>v", "Split vertically" },
  { "<leader>sx", ":close<CR>", "Close split" },
})

k.set_keymaps("i", {
  { "kk", "<Esc>", "Quit INSERT mode" },
})
