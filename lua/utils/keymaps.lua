local k = {}

---@param mode string|string[]
---@param lhs string
---@param rhs string|fun():nil
---@param desc_or_opts string|table
---@param opts? table
function k.set_keymap(mode, lhs, rhs, desc_or_opts, opts)
  if not opts then
    opts = type(desc_or_opts) == "table" and desc_or_opts or { desc = desc_or_opts }
  else
    opts.desc = desc_or_opts
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

---@param default_mode string|string[]
---@param maps ({[1]: string, [2]: string|(fun():nil), [3]?: string, [4]?: table}|table)[]
---@param default_opts? table
function k.set_keymaps(default_mode, maps, default_opts)
  default_opts = default_opts or { silent = true, noremap = true }
  for _, map in ipairs(maps) do
    local mode, lhs, rhs, map_opts = map.mode or default_mode, map[1], map[2], map[4] or {}
    map.desc = map.desc or map[3]
    map.mode, map[1], map[2], map[3], map[4] = nil, nil, nil, nil, nil
    local opts = vim.tbl_extend("keep", map, map_opts, default_opts, { silent = true })
    k.set_keymap(mode, lhs, rhs, opts)
  end
end

return k
