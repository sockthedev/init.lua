-- Init Lazy, a modern plugin manager for Neovim
-- @see https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy
require("lazy").setup("plugins", {
  checker = {
    enabled = true,
    concurrency = 8,
    frequency = 24 * 60 * 60, -- 24h
    notify = false,
  },
  concurrency = 8,
  ui = {
    border = "single",
  },
})
