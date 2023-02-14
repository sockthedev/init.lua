return {
  -- initial dashboard when opening neovim
  {
    "goolord/alpha-nvim",
    config = function()
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8

      local function footer()
        return "🧦 @sockthedev 🧦"
      end

      dashboard.section.footer.val = footer()

      require("alpha").setup(dashboard.opts)
    end,
  },

  -- icons
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        -- your personnal icons can go here (to override)
        -- DevIcon will be appended to `name`
        override = {},
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
      })
    end,
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- recommended settings from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- change color for arrows in tree to light blue
      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

      -- configure nvim-tree
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        open_on_setup = false,
        open_on_setup_file = false,
        hijack_directories = {
          enable = false,
        },
        update_focused_file = {
          enable = true,
          update_cwd = false,
        },
        view = {
          adaptive_size = false,
          hide_root_folder = true,
          float = {
            enable = true,
            -- We dynamically calculate the dimensions and position of the
            -- float window;
            open_win_config = function()
              local gheight = vim.api.nvim_list_uis()[1].height
              local gwidth = vim.api.nvim_list_uis()[1].width
              local width = 90
              local height = math.floor(gheight * 0.9)

              return {
                relative = "editor",
                width = width,
                height = height,
                row = (gheight - height) * 0.4,
                col = (gwidth - width) * 0.5,
                border = "rounded",
              }
            end,
          },
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        renderer = {
          root_folder_modifier = ":t",
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                untracked = "U",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { "^.git$" },
          no_buffer = false,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
      })

      -- keymaps
      vim.keymap.set("n", "tt", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle" })
    end,
  },

  -- buffer tabs
  {
    "romgrk/barbar.nvim",
    config = function()
      require("bufferline").setup({
        animation = false,
        auto_hide = true,
        closable = false,
        clickable = false,
        highlight_alternate = false,
        highlight_inactive_file_icons = false,
        highlight_visible = false,
        icons = false,
        insert_at_end = true,
      })
    end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    after = "nord.nvim",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "solarized_dark",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = {},
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "filename",
              file_status = true, -- displays file status (readonly status, modified status)
              path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
            "encoding",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              file_status = true, -- displays file status (readonly status, modified status)
              path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "fugitive" },
      })
    end,
  },

  -- Zen mode editing
  {
    "folke/zen-mode.nvim",
    keys = {
      {
        "<leader>Z",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Toggle Zen Mode",
      },
    },
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          options = {
            signcolumn = "no",
            list = false,
            foldcolumn = "0",
            cursorline = true,
          },
        },
        plugins = {
          gitsigns = { enabled = false },
        },
      })
    end,
  },

  -- displays colors inline (hex, etc)
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
      })
    end,
  },

  -- tailwind color highlight
  {
    "princejoogie/tailwind-highlight.nvim",
  },

  -- noicer ui elements for messages, command line, and popup menu
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
  },
}
