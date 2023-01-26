return {

  -- nord theme
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    priority = 1,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },

  -- moonlight theme
  -- {
  --   "shaunsingh/moonlight.nvim",
  --   -- name = "moonlight",
  --   priority = 1,
  --   config = function()
  --     vim.cmd.colorscheme("moonlight")
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
