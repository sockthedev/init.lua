-- safely import aerial
local status, aerial = pcall(require, "aerial")
if not status then
  return
end

-- configure aerial
aerial.setup({
  backends = { "treesitter", "lsp", "markdown", "man" },
  filter_kind = false,
  layout = {
    min_width = 30,
  },
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
