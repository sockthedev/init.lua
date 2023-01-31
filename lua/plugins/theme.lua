return {
  -- iceberg theme
  -- {
  --   "cocopon/iceberg.vim",
  --   priority = 1,
  --   config = function()
  --     vim.cmd.colorscheme("iceberg")
  --   end,
  -- },

  -- moonlight theme
  {
    "shaunsingh/moonlight.nvim",
    priority = 1,
    init = function()
      vim.g.moonlight_italic_comments = true
      vim.g.moonlight_italic_keywords = false
      vim.g.moonlight_italic_functions = false
      vim.g.moonlight_italic_variables = false
      vim.g.moonlight_contrast = false
      vim.g.moonlight_borders = true
      vim.g.moonlight_disable_background = false
    end,
    config = function()
      vim.cmd.colorscheme("moonlight")
    end,
  },

  -- nord theme
  -- {
  --   "shaunsingh/nord.nvim",
  --   name = "nord",
  --   priority = 1,
  --   config = function()
  --     vim.cmd.colorscheme("nord")
  --   end,
  -- },

  -- nightfox theme
  -- {
  --   "EdenEast/nightfox.nvim",
  --   priority = 1,
  --   config = function()
  --     vim.cmd.colorscheme("nordfox")
  --   end,
  -- },

  -- tokyonight theme
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1,
  --   opts = { style = "moon" },
  --   config = function()
  --     vim.cmd.colorscheme("tokyonight-moon")
  --     -- Fixes colorscheme setting for some plugins
  --     vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  --       callback = function()
  --         vim.schedule(function()
  --           vim.cmd.colorscheme("tokyonight-moon")
  --         end)
  --       end,
  --     })
  --   end,
  -- },
}
