local k = require("utils.keymaps")

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
  { "szw/vim-maximizer" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "svermeulen/vim-easyclip" },
  {
    "famiu/bufdelete.nvim",
    init = function()
      k.set_keymaps("n", {
        { "<M-q>", ":Bdelete<CR>", "[bufdelete] Close buffer" },
      })
    end,
  },
}

return plugins
