vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autowrite = true -- enable auto write
vim.opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "80"
vim.opt.conceallevel = 3 -- hide * markup for bold and italic
vim.opt.confirm = true -- confirm to save changes before exiting changed buffer
vim.opt.cursorline = true -- highlight the current line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.fillchars.eob = " "
vim.opt.foldenable = false
vim.opt.guicursor = "i:block" -- block cursor on insert
vim.opt.hidden = true -- enable modified buffers in background
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.incsearch = true
vim.opt.iskeyword:append("-") -- consider string-string as whole word
vim.opt.laststatus = 0
vim.opt.list = true -- show invisible chars
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.pumblend = 10 -- popup blend
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.scrolloff = 8 -- num lines to buffer scrolls by
vim.opt.shell = "/bin/zsh"
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.shortmess:append("c")
vim.opt.showcmd = false
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.softtabstop = 2 -- number of spaces that <Tab> uses while editing
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitbelow = true -- split horizontal window to the bottom
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.splitright = true -- split vertical window to the right
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- faster completion (4000ms default)
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.winminwidth = 5 -- minimum window width
vim.opt.wrap = false -- display lines as one long line
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.g.maximizer_default_mapping_key = "<M-m>"
vim.g.copilot_assume_mapped = true

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess = "filnxtToOFWIcC"
end

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0
