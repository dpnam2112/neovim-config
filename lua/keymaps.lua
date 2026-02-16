-- Keymaps Configuration
-- This file defines custom keybindings for general navigation,
-- LSP, and Telescope fuzzy finder, inspired by VSCode-like shortcuts.

-- <leader> is set in `init.lua`.

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Telescope keymaps
local telescope_builtin = require("telescope.builtin")

-- Open command palette (like VSCode)
vim.keymap.set("n", "<leader>:", telescope_builtin.commands, { desc = "Command palette" })

-- Toggle file explorer
vim.keymap.set("n", "<leader>fe", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- useful Telescope bindings
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>gr", telescope_builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fg", telescope_builtin.git_files, { desc = "Git files" })
vim.keymap.set("n", "<leader>ss", telescope_builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>xx", telescope_builtin.diagnostics, { desc = "Diagnostics" })

-- Press 'gl' to show the full diagnostic message in a floating window
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
