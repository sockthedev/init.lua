local k = require("utils.keymaps")

local plugins = {
  {
    "heavenshell/vim-jsdoc",
    ft = {
      "javascript",
      "javascriptreact",
    },
    build = "make install",
  },
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
