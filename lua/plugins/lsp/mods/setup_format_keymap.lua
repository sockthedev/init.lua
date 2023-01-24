local u = require("utils.keymaps")
local format = require("plugins.lsp.utils.format")

---@param client table
---@param bufnr integer
local function setup_format_keymap(client, bufnr)
  if not client.server_capabilities.documentFormattingProvider then
    return
  end

  local opts = { buffer = bufnr }

  u.set_keymap("n", "<leader>cf", format, "Format document", opts)

  if client.server_capabilities.documentRangeFormattingProvider then
    u.set_keymap("x", "<leader>cf", format, "Format range", opts)
  end
end

return setup_format_keymap
