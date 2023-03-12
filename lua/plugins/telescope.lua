local Util = require("utils")

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    { "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>/",       "<cmd>Telescope live_grep<cr>",                     desc = "Find in Files (Grep)" },
    { "<leader>:",       "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
    -- find
    { "<leader>fb",      "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
    { "<leader>ff",      "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
      end,
      desc = "Find All Files",
    },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "Recent" },
    {
      "<leader>ft",
      function()
        require("telescope").extensions.file_browser.file_browser()
      end,
      desc = "File Tree",
      noremap = true,
    },
    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>",               desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>",                desc = "status" },
    -- search
    { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "Auto Commands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>",               desc = "Diagnostics" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>",                 desc = "Grep" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>",                desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>",                   desc = "Key Maps" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>",                 desc = "Man Pages" },
    { "<leader>sm", "<cmd>Telescope marks<cr>",                     desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "Options" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>",               desc = "Word" },
    {
      "<leader>ss",
      Util.telescope("lsp_document_symbols", {
        cwd = false,
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol",
    },
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,               -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case",   -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      file_browser = {
        -- theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        -- mappings = {
        --   ["i"] = {
        --     -- your custom insert mode mappings
        --   },
        --   ["n"] = {
        --     -- your custom normal mode mappings
        --   },
        -- },
      },
    },
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<C-i>"] = function()
            Util.telescope("find_files", { no_ignore = true })()
          end,
          ["<C-h>"] = function()
            Util.telescope("find_files", { hidden = true })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
        },
      },
    },
    pickers = {
      buffers = {
        sort_lastused = true,
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer",
          },
          n = {
            ["<c-d>"] = "delete_buffer",
          },
        },
      },
    },
  },
  setup = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end,
}
