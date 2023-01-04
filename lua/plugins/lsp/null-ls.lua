local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local mods = require("plugins.lsp.mods")

---@diagnostic disable-next-line: redundant-parameter
null_ls.setup({
  sources = {
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
  bin = "prettier",
})
