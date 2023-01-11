local k = require("utils.keymaps")
--local wk = require("which-key")

k.set_keymaps({ "n", "v" }, {
  { "<Space>", "<Nop>", "Noop" },
})

k.set_keymaps("n", {
  { "<leader>w", ":w<CR>", "Save file" },
  { "<C-d>", "<C-d>zz", "Page down" },
  { "<C-u>", "<C-u>zz", "Page up" },
})

-- Modification
k.set_keymaps("n", {
  { "x", '"_x', "Delete character" },
  { "<leader>p", '"_dP', "Delete selection, pasting over contents, but keep paste register" },
})

-- Exiting things
k.set_keymaps("i", {
  { "kk", "<Esc>", "Quit INSERT mode" },
})
k.set_keymaps("n", {
  { "<leader>Q", ":qa<CR>", "Close all buffer/pane" },
  { "<leader>q", ":q<CR>", "Close buffer/pane" },
})

-- Line actions
-- wk.register({ l = { name = "Lines" } }, { prefix = "<leader>" })
k.set_keymaps("n", {
  { "<leader>hD", "yyP", "Duplicate line up" },
  { "<leader>hd", "yyp", "Duplicate line down" },
  { "<leader>hj", "ddp", "Move line up" },
  { "<leader>hk", "ddkP", "Move line down" },
  { "<leader>hI", "O<Esc>", "Insert empty line above" },
  { "<leader>hi", "o<Esc>", "Insert empty line below" },
})

-- Splits
k.set_keymaps("n", {
  { "<leader>se", "<C-w>=", "Make splits equal size" },
  { "<leader>sh", "<C-w>s", "Split horizontally" },
  { "<leader>sv", "<C-w>v", "Split vertically" },
  { "<leader>sx", ":close<CR>", "Close split" },
})

-- Search
k.set_keymaps("n", {
  { "<leader>fx", ":nohl<CR>", "Clear search highlighting" },
  { "n", "nzz", "Next search result" },
  { "N", "Nzz", "Previous search result" },
})
