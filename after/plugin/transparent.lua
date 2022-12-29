-- import transparent plugin safely
local status, transparent = pcall(require, "transparent")
if not status then
  return
end

-- configure transparent
transparent.setup({
  enable = true
})

