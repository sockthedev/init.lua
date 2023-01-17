local u = require("utils.keymaps")

require("trouble").setup({
  action_keys = {
    close = "xq",
  },
})

u.set_keymap("n", "<Leader>ia", ":TroubleToggle<CR>", "List all issues")
