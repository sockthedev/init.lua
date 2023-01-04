vim.fn.sign_define("LightBulbSign", {
  text = "",
  texthl = "DiagnosticSignHint",
})

local lightbulb = require("nvim-lightbulb")

lightbulb.setup({
  sign = {
    enabled = true,
    priority = 10,
  },
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = { "*" },
  group = vim.api.nvim_create_augroup("LightBulb", { clear = true }),
  desc = "lua require('nvim-lightbulb').update_lightbulb()",
  callback = function(params)
    lightbulb.update_lightbulb()
  end,
})
