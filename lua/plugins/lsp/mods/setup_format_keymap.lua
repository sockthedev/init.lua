local u = require("utils.keymaps")
local format = require("plugins.lsp.mods.format")

---@param client table
---@param bufnr integer
local function setup_format_keymap(client, bufnr)
  if not client.server_capabilities.documentFormattingProvider then
    return
  end

  local opts = { buffer = bufnr }

  u.set_keymap("n", "<Leader>f<Leader>", format, "[lsp] format", opts)

  if client.server_capabilities.documentRangeFormattingProvider then
    u.set_keymap("x", "<Leader>f<Leader>", format, "[lsp] format", opts)
  end
end

return setup_format_keymap
