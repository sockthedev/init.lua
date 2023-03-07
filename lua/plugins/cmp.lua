return {
  "hrsh7th/nvim-cmp", -- completion engine plugin for neovim
  version = false, -- last release is way too old
  dependencies = {
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
    "hrsh7th/cmp-path", -- completions for file paths
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
      mapping = {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ---@diagnostic disable-next-line: missing-parameter
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.InsertEnter,
          select = true, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
      },
      -- the order of sources matters
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
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
}
