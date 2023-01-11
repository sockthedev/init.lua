local plugin = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      dependencies = {
        "kkharji/sqlite.lua",
      },
    },
  },
}

function plugin.init()
  local u = require("utils.keymaps")

  u.set_keymaps("n", {
    {
      "<Leader>tb",
      function()
        require("telescope.builtin").buffers()
      end,
      "[telescope] buffers",
    },
    {
      "<Leader>tf",
      function()
        require("telescope.builtin").find_files()
      end,
      "[telescope] files",
    },
    {
      "<Leader>tg",
      function()
        require("telescope.builtin").git_files()
      end,
      "[telescope] git files",
    },
    {
      "<Leader>to",
      function()
        require("telescope.builtin").oldfiles()
      end,
      "[telescope] old files",
    },
    {
      "<Leader>tc",
      function()
        require("telescope.builtin").live_grep()
      end,
      "[telescope] content",
    },
    {
      "<Leader>th",
      function()
        require("telescope.builtin").help_tags()
      end,
      "[telescope] help tags",
    },
    {
      "<Leader>tr",
      function()
        require("telescope.builtin").lsp_references({ layout_strategy = "vertical" })
      end,
      "[telescope] lsp references",
    },
    {
      "<Leader>t;",
      function()
        require("telescope.builtin").resume()
      end,
      "[telescope] resume picker",
    },
  })
end

function plugin.config()
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-s>"] = "select_horizontal",
        },
        n = {
          ["<C-s>"] = "select_horizontal",
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      frecency = {
        default_workspace = "LSP",
        show_unindexed = false,
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("frecency")
end

return plugin
