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
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      "Buffers",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      "Files",
    },
    {
      "<leader>fv",
      function()
        require("telescope.builtin").git_files()
      end,
      "Git files",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").oldfiles()
      end,
      "Recent",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      "Grep",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      "Help",
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").lsp_references({ layout_strategy = "vertical" })
      end,
      "Lsp references",
    },
    {
      "<leader>f;",
      function()
        require("telescope.builtin").resume()
      end,
      "Resume picker",
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
