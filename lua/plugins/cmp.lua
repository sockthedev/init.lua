local cmp = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "onsails/lspkind-nvim",
    { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
    { "tamago324/cmp-zsh" },
  },
  event = "InsertEnter",
  init = function()
    vim.o.completeopt = "menu,menuone,noselect"
  end,
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    lspkind.init({
      symbol_map = {
        Copilot = "",
      },
    })
    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

    cmp.setup({
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<c-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { "i", "c" }
        ),
        ["<M-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          { "i", "c" }
        ),
        ["<c-space>"] = cmp.mapping({
          i = cmp.mapping.complete({}),
          c = function(
            _ --[[fallback]]
          )
            if cmp.visible() then
              if not cmp.confirm({ select = true }) then
                return
              end
            else
              cmp.complete()
            end
          end,
        }),
        ["<tab>"] = cmp.config.disable,
      },

      -- the order of sources matters
      sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "copilot" },
      }, {
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
      }),

      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          -- copied from cmp-under, but I don't think I need the plugin for this.
          -- I might add some more of my own.
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find("^_+")
            local _, entry2_under = entry2.completion_item.label:find("^_+")
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,
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
          with_text = true,
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
        native_menu = false,
        ghost_text = false,
      },
    })
  end,
}

local plugins = {
  cmp,
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Copilot",
    event = "VimEnter",
    config = function()
      require("copilot").setup()
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}

return plugins
