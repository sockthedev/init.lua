return {
  -- nord theme
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    priorty = 1,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },

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
  --   end,
  -- },
}
