local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
  ensure_installed = {
    "astro",
    "comment",
    "css",
    "graphql",
    "help",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "regex",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" },
  },
  matchup = {
    enable = true,
    include_match_words = true,
  },
  playground = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
    },
  },
})

vim.cmd([[
  autocmd Syntax css,html,javascript,javascriptreact,json,typescript,typescriptreact,yaml
   \ set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
]])
