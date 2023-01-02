-- import rosepine safely
local rosepine_setup, rosepine = pcall(require, "rose-pine")
if not rosepine_setup then
  return
end

-- configure theme
rosepine.setup({
  disable_background = true,
  disable_float_background = true,
  dark_variant = 'moon',
})

function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
