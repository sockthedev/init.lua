-- safely import mason
local status, mason = pcall(require, "mason")
if not status then
  return
end

-- safely import mason lspconfig
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  return
end

-- configure mason
mason.setup({})

-- configure mason-lspconfig
lspconfig.setup({
  ensure_installed = {
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
    "graphql",
  },
})
