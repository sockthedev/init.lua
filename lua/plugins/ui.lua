local plugins = {
  {
    "goolord/alpha-nvim",
    config = function()
      require("plugins.ui.alpha")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.ui.nvim-tree")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("plugins.ui.theme")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.ui.lualine")
    end,
  },
  {
    "levouh/tint.nvim",
    config = function()
      require("tint").setup({
        tint = -55,
        saturation = 0.5,
      })
    end,
  },
}

return plugins
