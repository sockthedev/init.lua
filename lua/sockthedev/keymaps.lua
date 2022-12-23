-- Keymaps
-- Here be all the keyboard customisations

-- Shorten keymap function ref
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

-- Leader key  
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Translate "Space" into a "Nop" in normal/visual mode
keymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- Better page up/down
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Move line up/down
keymap("n", "<leader>j", "ddp", opts)
keymap("n", "<leader>k", "ddkP", opts)

-- Copy line
keymap("n", "<leader>l", "yyp", opts)

-- New empty line
keymap("n", "<leader>o", "o<Esc>", opts)
keymap("n", "<leader>O", "O<Esc>", opts)

-- Close windows
keymap("n", "<leader>q", ":q<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Quick escape to normal mode
keymap('t', '<Esc>', '<C-\\> <C-n>', { noremap = true })

-- Diagnostic Navigation
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)


-- Pane Switching
-- This works just like the standard vim navigation, you just got to
-- navigate towards your target pane.
keymap('n', '<C-h>', '<C-w><C-h>', { silent = true })
keymap('n', '<C-j>', '<C-w><C-j>', { silent = true })
keymap('n', '<C-k>', '<C-w><C-k>', { silent = true })
keymap('n', '<C-l>', '<C-w><C-l>', { silent = true })

---------------
-- Fugitive

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

---------------
-- Telescope 

local tbuiltin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', tbuiltin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>si', tbuiltin.git_files, { desc = '[S]earch G[i]t' })
vim.keymap.set('n', '<leader>sh', tbuiltin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', tbuiltin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', tbuiltin.live_grep, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<leader>?', tbuiltin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', tbuiltin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tbuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>sd', tbuiltin.diagnostics, { desc = '[S]earch [D]iagnostics' })

---------------
-- LSP

keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

keymap('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
keymap('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
keymap('n', 'gI', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
keymap('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
keymap('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
keymap('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

-- See `:help K` for why this keymap
keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
keymap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

-- Lesser used LSP functionality
keymap('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
keymap('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist Folders' })

