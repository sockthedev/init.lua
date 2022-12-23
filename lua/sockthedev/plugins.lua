local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  -- Package manager, packer manages itself :D
  use 'wbthomason/packer.nvim'

  -- Speed up loading Lua modules in Neovim to improve startup time.
  -- https://github.com/lewis6991/impatient.nvim
  use 'lewis6991/impatient.nvim'

  -- LSP Configuration & Plugins
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  -- Terminal
  -- https://github.com/akinsho/toggleterm.nvim
  use('akinsho/toggleterm.nvim')

  -- Nvim Tree (A file explorer)
  -- https://github.com/nvim-tree/nvim-tree.lua
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Prettier
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- ESLint
  use('MunifTanjim/eslint.nvim')

  -- LSP Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  -- Highlight, edit, and navigate code
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  -- Additional text objects via treesitter
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- Theme
  -- use 'saltdotac/citylights.vim'
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  -- Fancier statusline
  use 'nvim-lualine/lualine.nvim'

  -- "gc" to comment visual regions/lines
  use 'numToStr/Comment.nvim'

  -- Detect tabstop and shiftwidth automatically
  use 'tpope/vim-sleuth'

  -- Fuzzy Finder (files, lsp, etc)
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1
  }

end)
