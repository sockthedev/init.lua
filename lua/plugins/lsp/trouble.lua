local u = require("utils.keymaps")

require("trouble").setup({
  action_keys = {
    close = "gq",
  },
})

u.set_keymap("n", "<Leader>xx", ":TroubleToggle<CR>", "toggle trouble")
