local u = require("utils.keymaps")

require("trouble").setup({
  action_keys = {
    close = "xq",
  },
})

u.set_keymap("n", "<Leader>il", ":TroubleToggle<CR>", "List issues")
