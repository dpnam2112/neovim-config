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

      vim.lsp.config("gopls", {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            usePlaceholders = true,
            completeUnimported = true,
            gofumpt = true,
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
        root_dir = vim.fs.root(0, { ".terraform", "*.tf" }),
        capabilities = capabilities,
      })

      vim.lsp.config("ansiblels", {
        cmd = { "ansible-language-server", "--stdio" },
        filetypes = { "yaml", "ansible" },
        root_dir = vim.fs.root(0, { "ansible.cfg", ".ansible-lint" }),
        settings = {
          ansible = {
            ansible = {
              -- Optionally specify a custom Ansible path
              -- path = "/usr/bin/ansible",
            },
            python = {
              interpreterPath = "python3",
            },
            validation = {
              enabled = true,
              lint = {
                enabled = true,
                path = "ansible-lint",
              },
            },
          },
        },
        capabilities = capabilities,
      })


      -- enable servers
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
      vim.lsp.enable("terraformls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("gopls")

      -- These DSLs are yaml-based
      local root_markers = {
        helm_ls = { "Chart.yaml" },
        terraformls = { ".terraform", "*.tf" },
        ansiblels = { "ansible.cfg", ".ansible-lint" }
      }

      for langserver, root_marker in pairs(root_markers) do
        if vim.fs.root(0, root_marker) ~= nil then
          vim.lsp.enable(langserver)
        end
      end
    end
  },
}

