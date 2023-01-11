local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "jose-elias-alvarez/typescript.nvim",
      "onsails/lspkind-nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          "williamboman/mason.nvim",
          cmd = "Mason",
          config = {
            ui = { border = "rounded" },
          },
        },
      },
      "j-hui/fidget.nvim",
    },
    event = "BufReadPre",
    config = function()
      require("plugins.lsp.base")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "MunifTanjim/eslint.nvim",
      "MunifTanjim/prettier.nvim",
    },
    event = "BufReadPre",
    config = function()
      require("plugins.lsp.null-ls")
    end,
  },
  {
    "folke/trouble.nvim",
    event = "LspAttach",
    config = function()
      require("plugins.lsp.trouble")
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local k = require("utils.keymaps")

      local saga = require("lspsaga")

      saga.init_lsp_saga({
        show_outline = {
          win_position = "left_with",
          auto_enter = false,
        },
      })

      k.set_keymaps({ "n", "v" }, {
        { "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code action" },
      })

      k.set_keymaps("n", {
        { "<leader>lf", "<CMD>Lspsaga lsp_finder<CR>", "Finder" },
        { "<leader>lr", "<CMD>Lspsaga rename<CR>", "Rename" },
        { "<leader>lp", "<CMD>Lspsaga peek_definition<CR>", "Peek" },
        {
          "<leader>lx",
          "<cmd>Lspsaga show_line_diagnostics<CR>",
          "Line diagnostics",
        },
        {
          "<leader>lc",
          "<cmd>Lspsaga show_cursor_diagnostics<CR>",
          "Show cursor diagnostics",
        },
        { "<leader>le", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump to prev diagnostic" },
        { "<leader>le", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to next diagnostics" },
        {
          "<leader>lE",
          function()
            require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
          end,
          "Jump to prev error",
        },
        {
          "<leader>lE",
          function()
            require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
          end,
          "Jump to next error",
        },
        { "<leader>lo", "<CMD>Lspsaga outline<CR>", "Code outline" },
        { "<leader>lk", ":Lspsaga hover_doc<CR>", "Float documentation" },
      })
    end,
  },
}

return plugins
