-- ## Nvim Tree ##
-- https://github.com/nvim-tree/nvim-tree.lua
-- For complete list of available configuration options see :help nvim-tree-setup

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
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
})


