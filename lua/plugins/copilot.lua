-- copilot
return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "Copilot",
  event = "VimEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-Up>",
          accept_word = "<M-Right>",
          accept_line = "<M-Down>",
          prev = "<M-[>",
          next = "<M-]>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        auto_refresh = false,
        keymap = {
          accept = "<CR>",
          jump_prev = "<M-[>",
          jump_next = "<M-]>",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
    })
  end,
}
