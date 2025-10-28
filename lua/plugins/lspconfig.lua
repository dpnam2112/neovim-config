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

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yml" },
      })

      vim.lsp.config("helm_ls", {
      cmd = { "helm_ls", "serve" },
        filetypes = { "helm", "yaml" },
        root_dir = vim.fs.root(0, { "Chart.yaml" }),
        yamlls = {
          path = "yaml-language-server"
        }
      })

      vim.lsp.config("terraformls", {
        cmd = { "terraform-ls", "serve" },
        filetypes = { "terraform", "tf", "hcl", "tfvars" },
        root_dir = vim.fs.root(0, { ".terraform", ".git", "*.tf" }),
        capabilities = capabilities,
      })

      -- enable servers
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
      vim.lsp.enable("helm_ls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("terraformls")
    end,
  },
}

