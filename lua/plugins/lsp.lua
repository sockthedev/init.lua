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
      require("utils.colors").setColorScheme()
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "BufRead",
    config = function()
      require("plugins.lsp.lspsaga")
      require("utils.colors").setColorScheme()
    end,
  },
}

return plugins
