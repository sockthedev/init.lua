local u = require("utils.keymaps")

local plugins = {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
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
    end,
  },
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
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("diffview").setup({})

      local k = require("utils.keymaps")

      k.set_keymaps("n", {
        { "<leader>gdc", "<CMD>DiffviewFileHistory %<CR>", "[git] View current file history" },
        { "<leader>gdh", "<CMD>DiffviewFileHistory<CR>", "[git] View branch history" },
        { "<leader>gdx", "<CMD>DiffviewClose<CR>", "[git] Close diff view" },
        { "<leader>gdd", "<CMD>DiffviewOpen<CR>", "[git] Open diff view" },
        { "<leader>gdm", "<CMD>DiffviewOpen origin/main...HEAD<CR>", "[git] Open diff view" },
      })
    end,
  },
}

return plugins
