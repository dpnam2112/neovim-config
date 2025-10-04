return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- runs :TSUpdate after install
  config = function()
    require("nvim-treesitter.configs").setup {
      -- Languages you want parsers for
      ensure_installed = {
        "lua", "c", "cpp", "vim", "vimdoc", "query", "bash", "python", "javascript", "html", "css", "go"
      },

      -- Install parsers synchronously
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      highlight = {
        enable = true,              -- enable syntax highlighting
        additional_vim_regex_highlighting = false, -- turn off old regex highlighting
      },

      indent = { enable = true },  -- smarter indentation
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",   -- start selection
          node_incremental = "grn", -- expand to next node
          scope_incremental = "grc",
          node_decremental = "grm", -- shrink selection
        },
      },
    }
  end,
}

