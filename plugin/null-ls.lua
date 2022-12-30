-- safely import null_ls
local status, null_ls = pcall(require, "null_ls")
if not status then
  return
end

-- configure null_ls
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup({
  debug = true,
  sources = {
    formatting.stylua,
    formatting.prettierd,
    formatting.black,
    formatting.isort,
    diagnostics.eslint_d,
    code_actions.eslint_d,
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

    -- format file
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
