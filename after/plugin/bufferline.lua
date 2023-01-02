-- safely import bufferline 
local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

-- configure bufferline 
bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
  }
})

