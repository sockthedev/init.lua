local plugins = {
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    config = function()
      vim.cmd.colorscheme("nord")
      -- Fixes colorscheme setting for some plugins
      vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        callback = function()
          vim.schedule(function()
            vim.cmd.colorscheme("nord")
          end)
        end,
      })
    end,
  },

  -- initial dashboard when opening neovim
  {
    "goolord/alpha-nvim",
    config = function()
      require("plugins.ui.alpha")
    end,
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.ui.nvim-tree")
    end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    after = "nord.nvim",
    config = function()
      require("plugins.ui.lualine")
    end,
  },

  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
        },
      })

      local k = require("utils.keymaps")

      k.set_keymaps("n", {
        {
          "<leader>Z",
          function()
            require("zen-mode").toggle()
          end,
          "[zen] Toggle",
        },
      })
    end,
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "nvim-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufReadPre",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "nvim-tree",
          "Trouble",
          "lazy",
          "mason",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require("mini.indentscope").setup(opts)
    end,
  },
}

return plugins
