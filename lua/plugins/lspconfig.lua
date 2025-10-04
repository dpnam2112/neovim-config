return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason").setup()

      -- Set defaults for ALL servers
      vim.lsp.config("*", {
	capabilities = capabilities,
      })

      -- per-server tweaks
      vim.lsp.config("lua_ls", {
	settings = {
	  Lua = {
	    diagnostics = { globals = { "vim" } },
	    workspace = { checkThirdParty = false },
	  },
	},
      })

      -- enable servers
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
      vim.lsp.enable("volar")
    end,
  },
}

