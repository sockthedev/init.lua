local document_highlight = require("plugins.lsp.utils.document_highlight")

---@param client table
---@param bufnr integer
local function setup_document_highlight(client, bufnr)
  if not client.server_capabilities.documentHighlightProvider then
    return
  end

  local group = vim.api.nvim_create_augroup("lsp_document_highlight", {})
  vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    group = group,
    callback = function()
      return document_highlight(client.offset_encoding)
    end,
    desc = "[lsp] document highlight",
  })

  vim.api.nvim_create_autocmd("CursorMoved", {
    buffer = bufnr,
    group = group,
    callback = vim.lsp.buf.clear_references,
    desc = "[lsp] clear references",
  })
end

return setup_document_highlight
