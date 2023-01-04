local plugins = {
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
  },
  { "bkad/CamelCaseMotion" },
  {
    "heavenshell/vim-jsdoc",
    ft = {
      "javascript",
      "javascriptreact",
    },
    build = "make install",
  },
  { "powerman/vim-plugin-AnsiEsc" },
  {
    "rrethy/vim-hexokinase",
    build = "make hexokinase",
    event = "VeryLazy",
  },
  { "szw/vim-maximizer" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "svermeulen/vim-easyclip" },
}

return plugins
