local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      "windwp/nvim-ts-autotag",
    },
    event = "BufReadPost",
    config = function()
      require("plugins.treesitter.base")
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("plugins.treesitter.comment")
    end,
  },
}

return plugins
