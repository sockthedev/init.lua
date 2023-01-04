-- Shorten keymap function ref
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

-- Disable space in normal/visual
keymap({ "n", "v" }, "<Space>", "<Nop>", opts)

-- Save file
keymap("n", "<leader>w", ":w<CR>")

-- Delete char does not go into register
keymap("n", "x", '"_x', opts)

-- Map kk to Esc when editing
keymap("i", "kk", "<Esc>", opts)

-- Clear search highlighting
keymap("n", "<leader>c", ":nohl<CR>", opts)

-- Better page up/down
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Move line up/down
keymap("n", "<leader>j", "ddp", opts)
keymap("n", "<leader>k", "ddkP", opts)

-- Duplicate line
keymap("n", "<leader>l", "yyp", opts)
keymap("n", "<leader>L", "yyP", opts)

-- New empty line
keymap("n", "<leader>o", "o<Esc>", opts)
keymap("n", "<leader>O", "O<Esc>", opts)

-- Close split/window
keymap("n", "<leader>q", ":q<CR>", opts) -- Close current split
keymap("n", "<leader>Q", ":qa<CR>") -- Close all splits and exit

-- Diagnostic Navigation
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<leader>e", vim.diagnostic.open_float)
keymap("n", "<leader>d", vim.diagnostic.setloclist)

-- Splits
keymap("n", "<leader>sv", "<C-w>v", opts) -- split verically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make splits equal size
keymap("n", "<leader>sx", ":close<CR>", opts) -- close split

-- buffers
keymap("n", "<leader>n", "<cmd>bn<CR>", opts) -- next buffer
keymap("n", "<leader>p", "<cmd>bp<CR>", opts) -- previous buffer
-- keymap('n', '<leader>xx', '<cmd>Bdelete!<CR>', opts) -- close current buffer
-- keymap('n', '<leader>xr', '<cmd>BufferLineCloseRight<CR>', opts) -- close right buffers
-- keymap('n', '<leader>xl', '<cmd>BufferLineCloseLeft<CR>', opts) -- close left buffers
keymap("n", "<S-q>", "<cmd>bd<CR>", opts) -- Close all buffers

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
