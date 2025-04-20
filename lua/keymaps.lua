-- Keymaps Configuration
-- This file defines custom keybindings for general navigation,
-- LSP, and Telescope fuzzy finder, inspired by VSCode-like shortcuts.

-- <leader> is set in `init.lua`.

-- Toggle file explorer
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Go to definition in a new tab
vim.api.nvim_set_keymap('n', 'gd', '<cmd>tab split | lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- Telescope keymaps
local telescope_builtin = require("telescope.builtin")

-- VSCode-like file finder
vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, { desc = "Find files" })

-- Open buffer list
vim.keymap.set('n', '<C-b>', telescope_builtin.buffers, { desc = "Open buffers (Telescope)" })

-- Live grep across files
vim.keymap.set('n', '<C-f>', telescope_builtin.live_grep, { desc = "Search in files (grep)" })

-- Open command palette (like VSCode)
vim.keymap.set('n', '<leader>:', telescope_builtin.commands, { desc = "Command palette" })

-- Other useful Telescope bindings
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fr', telescope_builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set('n', '<leader>fg', telescope_builtin.git_files, { desc = "Git files" })
vim.keymap.set('n', '<leader>ss', telescope_builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set('n', '<leader>xx', telescope_builtin.diagnostics, { desc = "Diagnostics" })
