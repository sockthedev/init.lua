local format = require("plugins.lsp.utils.format")

local function setup_format_on_save(client, bufnr, options)
  if not client.server_capabilities.documentFormattingProvider then
    return
  end

  options = options or {}

  local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
  vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })

  local is_async = options.async
  vim.api.nvim_create_autocmd(is_async and "BufWritePost" or "BufWritePre", {
    buffer = bufnr,
    group = group,
    callback = function()
      format({ bufnr = bufnr, async = is_async })
    end,
    desc = "[lsp] format on save",
  })
end

return setup_format_on_save
