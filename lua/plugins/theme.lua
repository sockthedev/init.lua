return {
  -- nightfox theme
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd.colorscheme("nordfox")
      -- Fixes colorscheme setting for some plugins
      vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        callback = function()
          vim.schedule(function()
            vim.cmd.colorscheme("nordfox")
          end)
        end,
      })
    end,
  },

  -- nord theme
  -- {
  --   "shaunsingh/nord.nvim",
  --   name = "nord",
  --   config = function()
  --     vim.cmd.colorscheme("nord")
  --     -- Fixes colorscheme setting for some plugins
  --     vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  --       callback = function()
  --         vim.schedule(function()
  --           vim.cmd.colorscheme("nord")
  --         end)
  --       end,
  --     })
  --   end,
  -- },

  -- tokyonight theme
  -- {
  --   "folke/tokyonight.nvim",
  --   -- opts = { style = "moon" },
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
