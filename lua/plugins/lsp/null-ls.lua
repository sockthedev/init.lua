local null_ls = require("null-ls")
local prettier = require("prettier")
local format = require("plugins.lsp.utils.format")
local setup_format_on_save = require("plugins.lsp.utils.setup-format-on-save")
local setup_keymaps = require("plugins.lsp.utils.setup-keymaps")

null_ls.setup({
  debug = true,
  sources = {
    null_ls.builtins.diagnostics.luacheck.with({
      condition = function(utils)
        return utils.root_has_file({ ".luacheckrc" })
      end,
    }),
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.cspell,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    }),
  },
  on_attach = function(client, bufnr)
    setup_keymaps(bufnr)

    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>F", function()
        format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "Format" })

      setup_format_on_save(client, bufnr)
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>F", function()
        format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "Format" })
    end
  end,
})

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

require("mason-null-ls").setup({
  ensure_installed = {
    "eslint_d",
    "prettierd",
    "stylua",
  },
})
