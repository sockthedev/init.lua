local plugin = {
  "akinsho/toggleterm.nvim",
  -- tag = "*",
}

function plugin.config()
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

  local k = require("utils.keymaps")

  local Terminal = require("toggleterm.terminal").Terminal

  local function split_terminal_horizontal()
    Terminal:new({ direction = "horizontal", close_on_exit = true }):open()
  end
  local function split_terminal_vertical()
    Terminal:new({ direction = "vertical", close_on_exit = true }):open()
  end
  local function split_terminal_float()
    Terminal:new({ direction = "float", close_on_exit = true }):open()
  end

  vim.api.nvim_create_user_command("CreateHorizontalTerminal", split_terminal_horizontal, {})
  vim.api.nvim_create_user_command("CreateVerticalTerminal", split_terminal_vertical, {})
  vim.api.nvim_create_user_command("CreateFloatTerminal", split_terminal_float, {})

  k.set_keymaps({ "n", "t" }, {
    { "<leader>xt", "<cmd>ToggleTermToggleAll<CR>", "Toggle terminals" },
    { "<leader>xh", "<cmd>CreateHorizontalTerminal<cr>", "Create horizontal terminal" },
    { "<leader>xv", "<cmd>CreateVerticalTerminal<cr>", "Create vertical terminal" },
    { "<leader>xf", "<cmd>CreateFloatTerminal<cr>", "Create float terminal" },
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
