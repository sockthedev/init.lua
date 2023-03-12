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
          untracked = { text = "▎" },
        },
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          -- stylua: ignore start
          map("n", "]h", gs.next_hunk, "Next Hunk")
          map("n", "[h", gs.prev_hunk, "Prev Hunk")
          map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
          map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
          map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
          map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
          map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
          map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
          map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
          map("n", "<leader>ghd", gs.diffthis, "Diff This")
          map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        end,
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      u.set_keymaps("n", {
        { "<leader>gf", vim.cmd.Git, "Open Fugitive" },
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
        { "<leader>gdc", "<CMD>DiffviewFileHistory %<CR>",           "File history" },
        { "<leader>gdh", "<CMD>DiffviewFileHistory<CR>",             "Branch history" },
        { "<leader>gdx", "<CMD>DiffviewClose<CR>",                   "Diff" },
        { "<leader>gdd", "<CMD>DiffviewOpen<CR>",                    "Current changes" },
        { "<leader>gdm", "<CMD>DiffviewOpen origin/main...HEAD<CR>", "Diff to main" },
      })
    end,
  },
}

return plugins
