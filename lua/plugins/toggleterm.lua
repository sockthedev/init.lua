local plugin = {
  "akinsho/toggleterm.nvim",
  -- tag = "*",
}

function plugin.config()
  require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    shade_terminals = false,
    start_in_insert = true,
    persist_mode = false,
  })

  local k = require("utils.keymaps")

  k.set_keymaps("n", {
    { "<leader>ct", ":ToggleTermToggleAll<CR>", "[toggleterm] toggle all" },
  })

  local Terminal = require("toggleterm.terminal").Terminal

  function split_terminal_horizontal()
    Terminal:new({ direction = "horizontal", close_on_exit = true }):open()
  end
  function split_terminal_vertical()
    Terminal:new({ direction = "vertical", close_on_exit = true }):open()
  end

  vim.api.nvim_create_user_command("SplitTerminalHorizontal", split_terminal_horizontal, {})
  vim.api.nvim_create_user_command("SplitTerminalVertical", split_terminal_vertical, {})

  vim.keymap.set({ "n", "t" }, "<leader>ch", "<cmd>SplitTerminalHorizontal<cr>")
  vim.keymap.set({ "n", "t" }, "<leader>cv", "<cmd>SplitTerminalVertical<cr>")

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "kk", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

return plugin
