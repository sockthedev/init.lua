local plugin = {
  "akinsho/toggleterm.nvim",
  tag = "*",
}

function plugin.config()
  require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    shade_terminals = false,
    start_in_insert = false,
  })

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