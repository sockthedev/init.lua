local plugin = {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}

function plugin.config()
  local k = require("utils.keymaps")

  require("aerial").setup({
    filter_kind = false,
    layout = {
      min_width = 30,
    },
    on_attach = function(bufnr)
      k.set_keymaps("n", {
        -- Jump forwards/backwards with '{' and '}'
        { "{", "<cmd>AerialPrev<CR>", "[aerial] jump prev", { buffer = bufnr } },
        { "}", "<cmd>AerialNext<CR>", "[aerial] jump next", { buffer = bufnr } },
      })
    end,
  })

  k.set_keymaps("n", {
    { "<leader>a", "<cmd>AerialToggle!<CR>", "[aerial] toggle" },
  })

  require("telescope").load_extension("aerial")
end

return plugin
