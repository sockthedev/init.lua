return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = function(term)
      local gheight = vim.api.nvim_list_uis()[1].height
      local gwidth = vim.api.nvim_list_uis()[1].width

      if term.direction == "vertical" then
        local minWidth = 70
        local thirdWidth = math.floor(gwidth / 3)
        if thirdWidth > minWidth then
          return thirdWidth
        else
          return minWidth
        end
      else
        local minHeight = 20
        local thirdHeight = math.floor(gheight / 3)
        if thirdHeight > minHeight then
          return thirdHeight
        else
          return minHeight
        end
      end
    end,
    shade_terminals = false,
    start_in_insert = true,
    persist_mode = true,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

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
