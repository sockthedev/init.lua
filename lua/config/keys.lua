local k = require("utils.keymaps")

-- Shorten keymap function ref
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

k.set_keymaps("n", {
  { "<Space>", "<Nop>", "Noop" },
  { "<leader>w", ":w<CR>", "Save file" },
  { "x", '"_x', "Delete character" },
  { "<leader>c", ":nohl<CR>", "Clear search highlighting" },
  { "<C-d>", "<C-d>zz", "Page down" },
  { "<C-u>", "<C-u>zz", "Page up" },
  { "<leader>j", "ddp", "Move line up" },
  { "<leader>k", "ddkP", "Move line down" },
  { "<leader>l", "yyp", "Duplicate line down" },
  { "<leader>L", "yyP", "Duplicate line up" },
  { "<leader>o", "o<Esc>", "Insert empty line below" },
  { "<leader>O", "O<Esc>", "Insert empty line above" },
  { "<leader>q", ":q<CR>", "Close pane/split" },
  { "<leader>Q", ":qa<CR>", "Close all panes/splits" },
  { "[d", vim.diagnostic.goto_prev, "[diagnostics] Go to prev issue" },
  { "]d", vim.diagnostic.goto_next, "[diagnostics] Go to next issue" },
  { "<leader>sv", "<C-w>v", "Split vertically" },
  { "<leader>sh", "<C-w>s", "Split horizontally" },
  { "<leader>se", "<C-w>=", "Make splits equal size" },
  { "<leader>sx", ":close<CR>", "Close split" },
})

k.set_keymaps("i", {
  { "kk", "<Esc>", "Quite INSERT mode" },
})

-- Fugitive

-- keymap("n", "<leader>gs", vim.cmd.Git)

-- Telescope

-- local tbuiltin = require("telescope.builtin")
-- keymap("n", "<leader>ff", tbuiltin.find_files, { desc = "[F]ind [F]iles" })
-- keymap("n", "<leader>fg", tbuiltin.git_files, { desc = "[F]ind [G]it" })
-- keymap("n", "<leader>fh", tbuiltin.help_tags, { desc = "[F]ind [H]elp" })
-- keymap("n", "<leader>fw", tbuiltin.grep_string, { desc = "[F]ind current [W]ord" })
-- keymap("n", "<leader>fr", tbuiltin.live_grep, { desc = "[F]ind by [R]egex" })
-- keymap("n", "<leader>?", tbuiltin.oldfiles, { desc = "[?] Find recently opened files" })
-- keymap("n", "<leader><space>", tbuiltin.buffers, { desc = "[ ] Find existing buffers" })
-- keymap("n", "<leader>/", function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   tbuiltin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--     winblend = 10,
--     previewer = false,
--   }))
-- end, { desc = "[/] Fuzzily search in current buffer]" })
-- keymap("n", "<leader>fd", tbuiltin.diagnostics, { desc = "[F]ind [D]iagnostics" })

-- LSP

-- keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
-- keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
-- keymap("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
-- keymap("n", "gr", tbuiltin.lsp_references, { desc = "[G]oto [R]eferences" })
-- keymap("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
-- keymap("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type [D]efinition" })
-- keymap("n", "<leader>ds", tbuiltin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
-- keymap("n", "<leader>ws", tbuiltin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
-- keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
-- keymap("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
-- Lesser used LSP functionality
-- keymap("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
-- keymap("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
-- keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
-- keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
-- keymap("n", "<leader>wl", function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, { desc = "[W]orkspace [L]ist Folders" })

-- Git Blame

-- keymap("n", "<leader>b", ":ToggleBlameLine<CR>", opts)
