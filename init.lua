vim.g.mapleader = " " -- Set <leader> to Space

-- General settings
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbers
vim.o.linebreak = true -- Break lines at word (requires Wrap lines)
vim.o.showbreak = "+++" -- Wrap-broken line prefix
vim.o.textwidth = 100 -- Line wrap (number of cols)
vim.o.showmatch = true -- Highlight matching brace
vim.o.encoding = "utf-8"
vim.opt.cursorline = true -- Highlight line
vim.o.hlsearch = true -- Highlight all search results
vim.o.smartcase = true -- Enable smart-case search
vim.o.ignorecase = true -- Always case-insensitive
vim.o.incsearch = true -- Searches for strings incrementally

vim.o.autoindent = true -- Auto-indent new lines
vim.o.smarttab = true -- Enable smart-tabs

-- Advanced settings
vim.o.ruler = true -- Show row and column ruler information
vim.o.undolevels = 1000 -- Number of undo levels
vim.o.backspace = "indent,eol,start" -- Backspace behavior

vim.opt.shiftwidth = 2

-- lazy.nvim configuration

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Keymaps
require("keymaps")

-- statusline
require("lualine").setup()
require("config")
require("config.nvim_cmp") -- Ensure this line exists in your init.lua
require("lsp_config")

-- Set tabs for Go files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.opt_local.expandtab = false -- Use tabs, not spaces
		vim.opt_local.tabstop = 4 -- Tab width = 4 spaces
		vim.opt_local.shiftwidth = 4 -- Indentation level
		vim.opt_local.softtabstop = 4 -- Makes Tab and Backspace work properly
	end,
})

vim.cmd.colorscheme("catppuccin")
