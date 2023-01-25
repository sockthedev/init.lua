return {
  -- cmp core
  {
    "hrsh7th/nvim-cmp", -- completion engine plugin for neovim
    version = false, -- last release is way too old
    dependencies = {
      "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
      "hrsh7th/cmp-path", -- completions for file paths
      "onsails/lspkind-nvim", -- VSCode-like pictograms
      { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
    },
    event = "InsertEnter",
    init = function()
      vim.o.completeopt = "menu,menuone,noselect"
    end,
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      -- Configure lsp symbol for Copilot
      lspkind.init({
        symbol_map = {
          Copilot = "",
        },
      })
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

      -- Utility to help with Copilot tab completions
      -- see https://github.com/zbirenbaum/copilot-cmp
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace, -- important for https://github.com/zbirenbaum/copilot-cmp
            select = true, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
          -- This helps with Copilot tab completions
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
        },
        -- the order of sources matters
        sources = cmp.config.sources({
          { name = "copilot", group_index = 2 },
          { name = "nvim_lsp", group_index = 2 }, -- lsp
          { name = "path", group_index = 2 }, -- file system paths
          { name = "luasnip", group_index = 2 }, -- snippets
          { name = "nvim_lua", group_index = 2 },
          { name = "buffer", group_index = 2 }, -- text within current buffer
        }),
        -- Recommended sorting adjustment to account for Copilot
        -- See https://github.com/zbirenbaum/copilot-cmp#comparators
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,
            require("copilot_cmp.comparators").score,

            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format({
            menu = {
              buffer = "[buf]",
              nvim_lsp = "[lsp]",
              nvim_lua = "[nvim]",
              path = "[path]",
              luasnip = "[snip]",
            },
          }),
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      })
    end,
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Copilot",
    event = "VimEnter",
    config = function()
      require("copilot").setup({
        -- It is recommended to disable copilot.lua's suggestion and panel
        -- modules, as they can interfere with completions properly appearing
        -- in copilot-cmp
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup({
        formatters = {
          -- experimental method for attempting to remove extraneous characters such as extra ending parenthesis
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      })
    end,
  },
}
