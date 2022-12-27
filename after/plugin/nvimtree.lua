-- ## Nvim Tree ##
-- https://github.com/nvim-tree/nvim-tree.lua
-- For complete list of available configuration options see :help nvim-tree-setup

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup = false,
  open_on_setup_file = false,
  hijack_directories = {
    enable = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true,
    hide_root_folder = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { '^.git$' },
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


