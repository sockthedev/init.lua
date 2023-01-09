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
        { "<leader>ca", "<cmd>Lspsaga code_action<CR>", "[lspsaga] code action", { silent = true } },
      })

      k.set_keymaps("n", {
        { "gh", "<CMD>Lspsaga lsp_finder<CR>", "[lspsaga] lsp finder", { silent = true } },
        { "<leader>cr", "<CMD>Lspsaga rename<CR>", "[lspsaga] rename", { silent = true } },
        { "<leader>cp", "<CMD>Lspsaga peek_definition<CR>", "[lspsaga] peek definition", { silent = true } },
        {
          "<leader>cd",
          "<cmd>Lspsaga show_line_diagnostics<CR>",
          "[lspsaga] show line diagnostics",
          { silent = true },
        },
        {
          "<leader>cd",
          "<cmd>Lspsaga show_cursor_diagnostics<CR>",
          "[lspsaga] show cursor diagnostics",
          { silent = true },
        },
        { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "[lspsaga] prev diagnostic jump", { silent = true } },
        { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", "[lspsaga] next diagnostics jump", { silent = true } },
        {
          "[E",
          function()
            require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
          end,
          "[lspsaga] jump to prev error",
          { silent = true },
        },
        {
          "]E",
          function()
            require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
          end,
          "[lspsaga] jump to next error",
          { silent = true },
        },
        { "<leader>co", "<CMD>Lspsaga outline<CR>", "[lspsaga] code outline", { silent = true } },
        { "K", ":Lspsaga hover_doc<CR>", "[lspsaga] hover documentation", { silent = true } },
        -- TODO: These are buggy. Revisit later.
        -- { "<C-x>", ":Lspsaga open_floaterm<CR>", "[lspsaga] open float terminal", { silent = true } },
        -- {
        --   "<C-X>",
        --   [[<C-\><C-n>:Lspsaga close_floaterm<CR>]],
        --   "[lspsaga] close float terminal",
        --   { silent = true },
        -- },
      })

      -- if you want to pass some cli command into a terminal you can do it like this
      -- open lazygit in lspsaga float terminal
      -- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
    end,
  },
}

return plugins
