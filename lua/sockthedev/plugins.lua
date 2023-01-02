-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
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
  use("wbthomason/packer.nvim")

  -- Speed up loading Lua modules in Neovim to improve startup time.
  use("lewis6991/impatient.nvim")

  -- Lua functions that are used by many plugins
  use("nvim-lua/plenary.nvim")

  -- Themes
  use("bluz71/vim-nightfly-guicolors")
  use({
    'rose-pine/neovim',
    as = 'rose-pine'
  })

  -- Nice status line
  use("nvim-lualine/lualine.nvim")

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")

  -- Change the char surrounding text (e.g. ' / ")
  use("tpope/vim-surround")

  -- Startup screen
  use("goolord/alpha-nvim")

  -- Show buffers as tabs
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Delete buffers (close files) without closing your windows or messing up your layout.
  use("moll/vim-bbye")

  -- Git
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")
  use("lewis6991/gitsigns.nvim")
  use("tveskag/nvim-blame-line") -- Inline git blame

  -- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

  -- File explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      -- File icons, lurvely
      "nvim-tree/nvim-web-devicons",
    },
  })

  -- Comment out lines with appropriate characters
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Detect tabstop and shiftwidth automatically
  use("tpope/vim-sleuth")

  -- Fuzzy Finder
  use({
    "nvim-telescope/telescope-fzf-native.nvim", -- better sorting performance
    run = "make",
    cond = vim.fn.executable("make") == 1,
  })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("RRethy/vim-illuminate")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("j-hui/fidget.nvim") -- Useful status updates for LSP
  use("folke/neodev.nvim") -- Additional lua configuration, makes nvim stuff amazing

  -- Linters and Formatters
  use("MunifTanjim/prettier.nvim")
  use("MunifTanjim/eslint.nvim")

  -- Completions Engine
  use("hrsh7th/nvim-cmp")

  -- Completion plugins
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-nvim-lua")

  -- Snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- bunch of snippets

  -- Code Outline
  use("stevearc/aerial.nvim")

  -- Code AST highlighting / editing / navigating
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  })
  use({
    -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  -- Auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  if packer_bootstrap then
    require("packer").sync()
  end
end)
