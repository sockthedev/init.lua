-- Vim Options 
-- :help vim.o

-- Using Neovim Tree, so need to disable netrw
-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Colors ar rad
vim.o.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default and relative
vim.wo.number = true
vim.o.relativenumber = true

-- Disable line wrapping
vim.o.wrap = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Save undo history
vim.o.undofile = true

-- Search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Ensure a buffer of lines always visible when scrolling
vim.opt.scrolloff = 8

-- Add a column indicator
vim.o.colorcolumn = '80'

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

