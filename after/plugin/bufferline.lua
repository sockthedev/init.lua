-- safely import bufferline 
local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

-- configure bufferline 
bufferline.setup({
  diagnostics = "nvim_lsp",
  numbers = 'ordinal',
})

