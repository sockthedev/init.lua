local plugins = {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({})
      require("utils.colors").setColorScheme()
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("plugins.ui.alpha")
      require("utils.colors").setColorScheme()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.ui.nvim-tree")
      require("utils.colors").setColorScheme()
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
