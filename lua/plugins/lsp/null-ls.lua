local null_ls = require("null-ls")
local mods = require("plugins.lsp.mods")

---@diagnostic disable-next-line: redundant-parameter
null_ls.setup({
  sources = {
    -- NOTE: we don't need prettierd or eslint_d in here as we are utilising
    -- other plugins for those below
    null_ls.builtins.diagnostics.luacheck.with({
      condition = function(utils)
        return utils.root_has_file({ ".luacheckrc" })
      end,
    }),
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    mods.setup_format_keymap(client, bufnr)
    mods.setup_format_on_save(client, bufnr)
  end,
})

require("mason-null-ls").setup({
  ensure_installed = {
    "eslint_d",
    "prettierd",
    "stylua",
  },
})

require("eslint").setup({
  bin = "eslint_d",
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type",
  },
})

local prettier = require("prettier")
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
