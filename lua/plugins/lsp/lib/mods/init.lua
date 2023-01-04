local mods = {
  format = require("plugins.lsp.lib.mods.format"),
  -- rename = require("plugins.lsp.lib.mods.rename"),
}

---@param offset_encoding 'utf-8'|'utf-16'|'utf-32'
function mods.document_highlight(offset_encoding)
  local params = vim.lsp.util.make_position_params(0, offset_encoding)
  vim.lsp.buf_request(0, "textDocument/documentHighlight", params, nil)
end

---@param offset_encoding 'utf-8'|'utf-16'|'utf-32'
function mods.hover(offset_encoding)
  local params = vim.lsp.util.make_position_params(0, offset_encoding)
  vim.lsp.buf_request(0, "textDocument/hover", params, nil)
end

return mods
