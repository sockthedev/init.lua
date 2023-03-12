return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
        or nil,
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
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",  -- completion engine plugin for neovim
    version = false,     -- last release is way too old
    dependencies = {
      "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
      "hrsh7th/cmp-path",  -- completions for file paths
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim", -- VSCode-like pictograms
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    event = "InsertEnter",
    init = function()
      vim.o.completeopt = "menu,menuone,noselect"
    end,
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local format_kinds = lspkind.cmp_format({
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[lsp]",
          nvim_lua = "[nvim]",
          path = "[path]",
        },
      })

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ---@diagnostic disable-next-line: missing-parameter
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.InsertEnter,
            select = true, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
        },
        -- the order of sources matters
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- lsp
          { name = "luasnip" },
          { name = "path" }, -- file system paths
          { name = "nvim_lua" },
        }, {
          { name = "buffer" }, -- text within current buffer
        }),
        formatting = {
          format = function(entry, item)
            format_kinds(entry, item)
            return require("tailwindcss-colorizer-cmp").formatter(entry, item)
          end,
        },
      })

      vim.cmd([[
        set completeopt=menuone,noinsert,noselect
        highlight! default link CmpItemKind CmpItemMenuDefault
      ]])
    end,
  },
}
