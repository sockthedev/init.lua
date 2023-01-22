local k = require("utils.keymaps")

k.set_keymaps({ "n", "v" }, {
  { "<Space>", "<Nop>", "Noop" },
})

-- better paging
k.set_keymaps("n", {
  { "<C-d>", "<C-d>zz", "Page down" },
  { "<C-u>", "<C-u>zz", "Page up" },
})

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Modification
k.set_keymaps("n", {
  { "x", '"_x', "Delete character" },
  { "<leader>p", '"_dP', "Paste, but keep paste register" },
})

-- Exit insert mode
k.set_keymaps("i", {
  { "jk", "<Esc>", "Exit INSERT mode" },
})

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Line actions
k.set_keymaps("n", {
  { "<leader>h", "yyP", "Duplicate line up" },
  { "<leader>l", "yyp", "Duplicate line down" },
  { "<leader>j", "ddp", "Move line up" },
  { "<leader>k", "ddkP", "Move line down" },
  { "<leader>O", "O<Esc>", "Insert empty line above" },
  { "<leader>o", "o<Esc>", "Insert empty line below" },
})

-- Splits
k.set_keymaps("n", {
  { "<leader>ue", "<C-w>=", "Make splits equal size" },
  { "<leader>uh", "<C-w>s", "Split horizontally" },
  { "<leader>uv", "<C-w>v", "Split vertically" },
})

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
