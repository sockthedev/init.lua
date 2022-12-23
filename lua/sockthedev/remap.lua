-- Keymaps
-- Here be all the keyboard customisations

-- Shorten keymap function ref
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

-- Leader key  
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Translate "Space" into a "Nop" in normal/visual mode
keymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- Better page up/down
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Move line up/down
keymap("n", "<leader>j", "ddp", opts)
keymap("n", "<leader>k", "ddkP", opts)

-- Copy line
keymap("n", "<leader>l", "yyp", opts)

-- New empty line
keymap("n", "<leader>o", "o<Esc>", opts)
keymap("n", "<leader>O", "O<Esc>", opts)

-- Close windows
keymap("n", "<leader>q", ":q<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Quick escape to normal mode
keymap('t', '<Esc>', '<C-\\> <C-n>', { noremap = true })

-- [[ Diagnostic Navigation]]
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)


-- [[ Pane Switching ]]
-- This works just like the standard vim navigation, you just got to
-- navigate towards your target pane.
keymap('n', '<C-h>', '<C-w><C-h>', { silent = true })
keymap('n', '<C-j>', '<C-w><C-j>', { silent = true })
keymap('n', '<C-k>', '<C-w><C-k>', { silent = true })
keymap('n', '<C-l>', '<C-w><C-l>', { silent = true })
