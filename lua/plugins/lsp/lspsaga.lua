local k = require("utils.keymaps")

local saga = require("lspsaga")

saga.setup({
  show_outline = {
    win_position = "left_with",
    auto_enter = false,
  },
  ui = {
    border = "single",
  },
})

k.set_keymaps({ "n", "v" }, {
  { "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code action" },
})

k.set_keymaps("n", {
  { "gr", "<CMD>Lspsaga lsp_finder<CR>", "[lsp] Open references" },
  { "<leader>cr", "<CMD>Lspsaga rename<CR>", "Rename" },
  { "gp", "<CMD>Lspsaga peek_definition<CR>", "[lsp] Peek" },
  {
    "<leader>il",
    "<cmd>Lspsaga show_line_diagnostics<CR>",
    "[lsp] Line diagnostics",
  },
  {
    "<leader>ic",
    "<cmd>Lspsaga show_cursor_diagnostics<CR>",
    "[lsp] Show cursor diagnostics",
  },
  { "<leader>ik", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "[lsp] Jump to prev diagnostic" },
  { "<leader>ij", "<cmd>Lspsaga diagnostic_jump_next<CR>", "[lsp] Jump to next diagnostics" },
  {
    "<leader>iK",
    function()
      require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end,
    "[lsp] Jump to prev error",
  },
  {
    "<leader>iJ",
    function()
      require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end,
    "[lsp] Jump to next error",
  },
  { "<leader>co", "<CMD>Lspsaga outline<CR>", "Toggle code outline" },
  { "gk", ":Lspsaga hover_doc<CR>", "[lsp] Show documentation" },
})
