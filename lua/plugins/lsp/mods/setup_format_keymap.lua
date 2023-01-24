local format = require("plugins.lsp.utils.format")

---@param client table
---@param bufnr integer
local function setup_format_keymap(client, bufnr)
  if not client.server_capabilities.documentFormattingProvider then
    return
  end

  vim.keymap.set("n", "<leader>cf", format, { desc = "Format document", buffer = bufnr })

  if client.server_capabilities.documentRangeFormattingProvider then
    vim.keymap.set("x", "<leader>cf", format, { desc = "Format range", buffer = bufnr })
  end
end

return setup_format_keymap
