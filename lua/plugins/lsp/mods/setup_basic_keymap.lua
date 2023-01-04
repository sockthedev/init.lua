local u = require("utils.keymaps")
local hover = require("plugins.lsp.mods.hover")

---@param client table
---@param bufnr integer
local function setup_basic_keymap(client, bufnr)
  local opts = { buffer = bufnr }

  u.set_keymaps("n", {
    { "gD", vim.lsp.buf.declaration, "[lsp] declaration" },
    { "gd", vim.lsp.buf.definition, "[lsp] definition" },
    {
      "K",
      function()
        hover(client.offset_encoding)
      end,
      "[lsp] hover",
    },
    { "gi", vim.lsp.buf.implementation, "[lsp] implementation" },
    { "<C-k>", vim.lsp.buf.signature_help, "[lsp] signature help", mode = { "n", "i" } },
    { "gy", vim.lsp.buf.type_definition, "[lsp] type definition" },
    -- { "<Leader>rn", custom.rename, "[lsp] rename" },
    { "gr", vim.lsp.buf.references, "[lsp] references" },
    { "<Leader>ac", vim.lsp.buf.code_action, "[lsp] code action", mode = { "n", "v" } },
    {
      "<Leader>do",
      function()
        vim.diagnostic.open_float({ scope = "line" })
      end,
      "[lsp] show line diagnostic",
    },
    { "[d", vim.diagnostic.goto_prev, "[lsp] prev diagnostic" },
    { "]d", vim.diagnostic.goto_next, "[lsp] next diagnostic" },
    { "<Leader>qf", vim.diagnostic.setloclist, "[lsp] diagnostic to location list" },
  }, opts)
end

return setup_basic_keymap
