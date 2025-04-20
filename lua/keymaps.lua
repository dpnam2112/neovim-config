vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
