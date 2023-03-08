return {
  {
    "folke/tokyonight.nvim",
    priority = 1,
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day",    -- The theme is used when the background is set to light
        transparent = true,     -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = false },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "transparent",       -- style for sidebars, see below
          floats = "transparent",         -- style for floating windows
        },
        sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false,             -- dims inactive windows
        lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
      })

      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- {
  --   "cocopon/iceberg.vim",
  --   priority = 1,
  --   config = function()
  --     vim.cmd.colorscheme("iceberg")
  --   end,
  -- },

  -- {
  --   "shaunsingh/moonlight.nvim",
  --   priority = 1,
  --   init = function()
  --     vim.g.moonlight_italic_comments = true
  --     vim.g.moonlight_italic_keywords = false
  --     vim.g.moonlight_italic_functions = false
  --     vim.g.moonlight_italic_variables = false
  --     vim.g.moonlight_contrast = false
  --     vim.g.moonlight_borders = true
  --     vim.g.moonlight_disable_background = true
  --   end,
  --   config = function()
  --     vim.cmd.colorscheme("moonlight")
  --   end,
  -- },

  -- {
  --   "shaunsingh/nord.nvim",
  --   name = "nord",
  --   priority = 1,
  --   config = function()
  --     vim.cmd.colorscheme("nord")
  --   end,
  -- },
}
