# 🧠 Neovim Setup Guide

This config is for a modern Neovim dev workflow with LSP, completion, theming, fuzzy finding, and file browsing.

---

## 🔧 Directory Structure

```
lua/
  plugins/       -- Plugin definitions (lazy.nvim)
    nvim_cmp/    -- Autocompletion setup
    lspconfig.lua -- LSP setup
    mason.lua     -- LSP/DAP installer
    lualine.lua   -- Statusline
    catppuccin.nvim.lua -- Theme
    nvim_tree.lua -- File explorer
    telescope.lua -- Fuzzy finder
    treesitter.lua -- Syntax highlighting
    ts_autotag.lua -- Autotag plugin
    ts_tools.lua   -- TypeScript tools
  keymaps.lua    -- Keybindings
init.lua         -- Entry point
```

---

## 📦 Plugins

* **lazy.nvim**: Plugin manager
* **LSP**: `nvim-lspconfig`, `mason.nvim`
* **Completion**: `nvim-cmp`, `LuaSnip`, `cmp-nvim-lsp`
* **UI**: `catppuccin`, `tokyonight`, `lualine.nvim`
* **Navigation**: `nvim-tree`, `telescope.nvim`, `fzf.vim`
* **Syntax**: `nvim-treesitter`, `nvim-ts-autotag`

---

## 🎨 Themes

In `init.lua`, set your theme:

```lua
vim.cmd.colorscheme("catppuccin")
-- or: vim.cmd.colorscheme("tokyonight")
```

---

## 💡 Keymaps

Defined in `lua/keymaps.lua`.

---

## ⚙️ External Dependencies

Some plugins require external tools:

* **Clipboard**: `xclip` (Linux), `pbcopy` (macOS), or `win32yank` (Windows)
* **FZF**: Install `fzf` binary for `fzf.vim`
* **LSP servers**: Install via `:Mason`

---

## 🚀 Setup

Clone repo into `~/.config/nvim`:

```sh
git clone <this-repo> ~/.config/nvim
nvim
```

---

## 🛠 Troubleshooting

* `:LspInfo` → Check active LSP clients
* `:checkhealth` → Diagnose plugin issues
* If broken, clear `~/.local/share/nvim` and restart
