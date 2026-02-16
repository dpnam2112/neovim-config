return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("treesitter-context").setup{
      enable = true,
      max_lines = 3, -- Limits the context window to 3 lines (good for small screens)
      trim_scope = 'outer',
    }
  end
}
