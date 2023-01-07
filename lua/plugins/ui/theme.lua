require("rose-pine").setup({
  -- dark_variant = "moon",
})

function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
end

ColorMyPencils()
