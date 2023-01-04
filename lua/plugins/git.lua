local u = require("utils.keymaps")

local plugin_gitsigns = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function plugin_gitsigns.config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      u.set_keymaps("n", {
        {
          "[c",
          function()
            if vim.wo.diff then
              return "[c"
            end

            vim.schedule(function()
              gitsigns.prev_hunk()
            end)

            return "<ignore>"
          end,
          "[git] prev change",
        },
        {
          "]c",
          function()
            if vim.wo.diff then
              return "]c"
            end

            vim.schedule(function()
              gitsigns.next_hunk()
            end)

            return "<ignore>"
          end,
          "[git] next change",
        },
      }, {
        buffer = bufnr,
        expr = true,
      })

      u.set_keymap("v", "<leader>gs", ":Gitsigns stage_hunk<cr>", {
        buffer = bufnr,
        desc = "[git] stage change",
      })
    end,
  })

  vim.schedule(function()
    vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GruvboxOrangeSign" })
  end)
end

local plugins = {
  plugin_gitsigns,
  { "rhysd/git-messenger.vim" },
  {
    "tpope/vim-fugitive",
    config = function()
      u.set_keymaps("n", {
        { "<leader>gs", vim.cmd.Git, "[git] open fugitive" },
      })
    end,
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      u.set_keymaps("n", {
        { "<leader>gb", ":GitBlameToggle<CR>", "[git] toggle blame" },
      })
    end,
    init = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_highlight_group = "Question"
      vim.g.gitblame_date_format = "%r"
    end,
  },
}

return plugins
