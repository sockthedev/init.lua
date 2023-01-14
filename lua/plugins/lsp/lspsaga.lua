local k = require("utils.keymaps")

local saga = require("lspsaga")

saga.setup({
  show_outline = {
    win_position = "left_with",
    auto_enter = false,
  },
})

k.set_keymaps({ "n", "v" }, {
  { "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code action" },
})

k.set_keymaps("n", {
  { "gu", "<CMD>Lspsaga lsp_finder<CR>", "Open references" },
  { "gr", "<CMD>Lspsaga rename<CR>", "Rename" },
  { "gp", "<CMD>Lspsaga peek_definition<CR>", "Peek" },
  {
    "<leader>lx",
    "<cmd>Lspsaga show_line_diagnostics<CR>",
    "Line diagnostics",
  },
  {
    "<leader>ic",
    "<cmd>Lspsaga show_cursor_diagnostics<CR>",
    "Show cursor diagnostics",
  },
  { "<leader>ik", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump to prev diagnostic" },
  { "<leader>ij", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to next diagnostics" },
  {
    "<leader>iK",
    function()
      require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end,
    "Jump to prev error",
  },
  {
    "<leader>iJ",
    function()
      require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end,
    "Jump to next error",
  },
  { "go", "<CMD>Lspsaga outline<CR>", "Toggle code outline" },
  { "gk", ":Lspsaga hover_doc<CR>", "Show documentation" },
})
