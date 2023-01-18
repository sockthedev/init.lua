local plugins = {
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    config = function()
      require("utils.colors").setColorScheme()
      require("nord").set()
    end,
  },
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
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.ui.lualine")
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
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
}

return plugins
