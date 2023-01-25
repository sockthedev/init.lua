return {
  "akinsho/toggleterm.nvim",
  -- tag = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      size = function(term)
        if term.direction == "vertical" then
          local minWidth = 50
          local quarterWindow = vim.o.columns / 3
          if quarterWindow > minWidth then
            print(string.format("using calculated %s", quarterWindow))
            return quarterWindow
          else
            print(string.format("using default %s", quarterWindow))
            return minWidth
          end
        else
          return 20
        end
      end,
      shade_terminals = false,
      start_in_insert = false,
      persist_mode = false,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    vim.keymap.set({ "n", "t" }, "<leader>tt", "<cmd>ToggleTermToggleAll<CR>", { desc = "Toggle All" })

    vim.keymap.set({ "n", "t" }, "<leader>t-", function()
      Terminal:new({ direction = "horizontal", close_on_exit = true }):open()
    end, { desc = "Create Horizontal" })

    vim.keymap.set({ "n", "t" }, "<leader>t|", function()
      Terminal:new({ direction = "vertical", close_on_exit = true }):open()
    end, { desc = "Create Vertical" })

    vim.keymap.set({ "n", "t" }, "<leader>tf", function()
      Terminal:new({ direction = "float", close_on_exit = true }):open()
    end, { desc = "Create Float" })

    vim.keymap.set({ "n", "t" }, "<leader>t<tab>", function()
      Terminal:new({ direction = "tab", close_on_exit = true }):open()
    end, { desc = "Create Tab" })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
