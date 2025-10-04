return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  }, -- LSP manager
}
