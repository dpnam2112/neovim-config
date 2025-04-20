# 🧠 Neovim Setup Reference

This config is tailored for a modern Neovim development experience with LSP, autocompletion, theming, fuzzy finding, and file browsing. Here's a breakdown of what each part does and how to modify them if needed.

---

## 🔧 Folder Structure

```
lua/
  config/        -- Theme, completion, mason setup
  lsp_config/    -- LSP server setup
  plugins/       -- Plugin list via lazy.nvim
  keymaps.lua    -- All keybindings
init.lua         -- Main entrypoint
```

---

## 📦 Plugins & Features

### Plugin Manager

- **lazy.nvim**: Used as the plugin manager. Auto-installs if missing.

### LSP

- `nvim-lspconfig` for configuring language servers.
- `mason.nvim` for managing LSP binaries.
- `cmp-nvim-lsp`, `nvim-cmp`, and `LuaSnip` for autocompletion.

### UI & Theming

- `catppuccin` and `tokyonight` themes (set via `init.lua`)
- `lualine.nvim` for statusline
- `nvim-tree` for file explorer
- `telescope.nvim` and `fzf.vim` for fuzzy finding

---

## 🎨 Themes

Edit this line in `init.lua` to switch theme:
```lua
vim.cmd.colorscheme("catppuccin")
-- or: vim.cmd.colorscheme("tokyonight")
```

---

## 💡 Keymaps

Located in `lua/keymaps.lua`. Highlights:

| Keybinding     | Action                                |
|----------------|----------------------------------------|
| `<C-p>`        | Find files (Telescope)                |
| `<C-b>`        | Toggle file tree / open buffers       |
| `<C-f>`        | Grep in files                         |
| `<leader>:`    | Open command palette (Telescope)      |
| `gd`           | Go to definition (in new tab)         |
| `<leader>xx`   | Show diagnostics                      |

---

## ⚙️ File-specific Settings

For Go files:
```lua
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
```

---

## 🛠 Adding New LSP Servers

1. Install via Mason:  
   `:Mason`

2. Add to `lua/lsp_config/init.lua`:
```lua
lspconfig.<server_name>.setup({
  capabilities = capabilities,
})
```

3. Done ✅

---

## ✨ Autocompletion

- Powered by `nvim-cmp` and `LuaSnip`
- Config at: `lua/config/nvim_cmp.lua`
- To add new sources or snippet engine, edit this file

---

## 🚀 Setup

Clone the repo or copy the files into your `~/.config/nvim`

```sh
git clone <this-repo> ~/.config/nvim
nvim
```

---

## 🧪 Troubleshooting Tips

- `:LspInfo`: Check active LSP clients
- `:checkhealth`: Diagnostic for broken plugins
- Delete `.local/share/nvim` if something's broken beyond repair

---

## ✅ TODO

- [ ] Add Treesitter config
- [ ] Add formatting/diagnostics tools via null-ls
- [ ] Setup debugger (DAP)

---

Made with ❤️ for future me.
