-- safely import bufferline 
local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

-- safely import scope 
local status2, scope = pcall(require, "scope")
if not status2 then
  return
end

-- configure bufferline 
bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
  }
})

-- configure scope
scope.setup()

