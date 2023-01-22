local k = require("utils.keymaps")

local saga = require("lspsaga")

saga.setup({
  show_outline = {
    win_position = "left_with",
    auto_enter = false,
  },
  ui = {
    border = "single",
    winblend = 10,
  },
})

k.set_keymaps({ "n", "v" }, {
  { "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code Action" },
})

k.set_keymaps("n", {
  { "gk", ":Lspsaga hover_doc<CR>", "[lsp] Show documentation" },
  { "gr", "<CMD>Lspsaga lsp_finder<CR>", "References" },
  { "gp", "<CMD>Lspsaga peek_definition<CR>", "Peek" },
  { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
  { "<leader>cr", "<CMD>Lspsaga rename<CR>", "Rename" },
  { "<leader>co", "<CMD>Lspsaga outline<CR>", "Toggle code outline" },
  {
    "<leader>xl",
    "<cmd>Lspsaga show_line_diagnostics<CR>",
    "Line diagnostics",
  },
  {
    "<leader>xc",
    "<cmd>Lspsaga show_cursor_diagnostics<CR>",
    "Cursor diagnostics",
  },
  { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic" },
  { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
  {
    "[e",
    function()
      require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end,
    "Prev Error",
  },
  {
    "]e",
    function()
      require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end,
    "Next Error",
  },
  {
    "[w",
    function()
      require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.WARN })
    end,
    "Prev Warning",
  },
  {
    "]w",
    function()
      require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.WARN })
    end,
    "Next Warning",
  },
})
