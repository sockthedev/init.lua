local k = require("utils.keymaps")

local plugins = {
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
  },
  {
    "heavenshell/vim-jsdoc",
    ft = {
      "javascript",
      "javascriptreact",
    },
    build = "make install",
  },
  { "powerman/vim-plugin-AnsiEsc" },
  { "szw/vim-maximizer" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  {
    "famiu/bufdelete.nvim",
    init = function()
      k.set_keymaps("n", {
        { "<M-q>", ":Bdelete<CR>", "[bufdelete] Close buffer" },
      })
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      require("plugins.ui.smart-splits")
    end,
  },
}

return plugins
