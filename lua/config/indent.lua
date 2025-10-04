-- expandtab: whether to use tabs or spaces
-- tabstop: how wide tabs visually look
-- shiftwidth: Defines how many spaces are used when indenting with commands like >> or autoindent.
-- softtabstop: Defines how many spaces Neovim inserts or deletes when you press <Tab> or <BS> in insert mode.

-- Default fallback (for any filetype not explicitly configured)
vim.opt.expandtab = true      -- use spaces by default
vim.opt.tabstop = 4           -- a tab looks like 4 spaces
vim.opt.shiftwidth = 4        -- >> indents by 4 spaces
vim.opt.softtabstop = 4       -- <Tab> acts like 4 spaces

-- Set tabs for Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false -- use tab
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Set tabs for Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
