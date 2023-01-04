---@param offset_encoding 'utf-8'|'utf-16'|'utf-32'
local function hover(offset_encoding)
  local params = vim.lsp.util.make_position_params(0, offset_encoding)
  vim.lsp.buf_request(0, "textDocument/hover", params, nil)
end

return hover
