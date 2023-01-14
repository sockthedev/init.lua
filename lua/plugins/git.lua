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
              "<leader>vp",
              function()
                if vim.wo.diff then
                  return "<leader>p"
                end

                vim.schedule(function()
                  gitsigns.prev_hunk()
                end)

                return "<ignore>"
              end,
              "Prev change",
            },
            {
              "<leader>vn",
              function()
                if vim.wo.diff then
                  return "<leader>vn"
                end

                vim.schedule(function()
                  gitsigns.next_hunk()
                end)

                return "<ignore>"
              end,
              "Next change",
            },
          }, {
            buffer = bufnr,
            expr = true,
          })

          u.set_keymap("v", "<leader>vs", ":Gitsigns stage_hunk<cr>", {
            buffer = bufnr,
            desc = "Stage change",
          })
        end,
      })

      vim.schedule(function()
        vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GruvboxOrangeSign" })
      end)
    end,
  },
  {
    "rhysd/git-messenger.vim",
    init = function()
      vim.g.git_messenger_no_default_mappings = true
    end,
    config = function()
      u.set_keymaps("n", {
        { "<leader>vi", "<CMD>GitMessenger<CR>", "Git messenger" },
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      u.set_keymaps("n", {
        { "<leader>vs", vim.cmd.Git, "Open fugitive" },
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
        { "<leader>vc", "<CMD>DiffviewFileHistory %<CR>", "View current file history" },
        { "<leader>vh", "<CMD>DiffviewFileHistory<CR>", "View branch history" },
        { "<leader>vx", "<CMD>DiffviewClose<CR>", "Close diff view" },
        { "<leader>vd", "<CMD>DiffviewOpen<CR>", "Open diff view" },
        { "<leader>vm", "<CMD>DiffviewOpen origin/main...HEAD<CR>", "Open diff view" },
      })
    end,
  },
}

return plugins
