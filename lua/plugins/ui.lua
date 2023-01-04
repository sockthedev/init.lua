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
    "mrjones2014/smart-splits.nvim",
    config = function()
      require("plugins.ui.smart-splits")
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
}

return plugins
