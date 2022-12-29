-- Colors, enable them
vim.o.termguicolors = true

-- ensure transparent backgrounds are used
vim.g.transparent_enabled = true
vim.g.nightflyTransparent = true
vim.g.nightflyCursorColor = true

-- Ensure terminals can hide/show without being recreated
vim.o.hidden = true

-- Line numbers, and relative
vim.wo.number = true
vim.o.relativenumber = true

-- Disable line wrapping
vim.o.wrap = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Save undo history
vim.o.undofile = true

-- Search highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.o.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true

-- Ensure a buffer of lines always visible when scrolling up/down
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

-- backspace
vim.o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.o.splitright = true -- split vertical window to the right
vim.o.splitbelow = true -- split horizontal window to the bottom

vim.opt.iskeyword:append("-") -- consider string-string as whole word

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

