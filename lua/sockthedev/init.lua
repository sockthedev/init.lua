-- Speed up loading Lua modules in Neovim to improve startup time.
-- https://github.com/lewis6991/impatient.nvim
require('impatient')

require('sockthedev.global')
require('sockthedev.set')
require('sockthedev.remap')

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
