return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- load only when you type
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("plugins.nvim_cmp.config")
    end
  }
}
