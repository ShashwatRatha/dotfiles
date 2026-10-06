return {
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },
  { 
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "rust_analyzer" }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    -- Load cmp immediately on typing text so it's ready for actions
    event = "InsertEnter",
    dependencies = { 
      "hrsh7th/cmp-nvim-lsp", 
      "hrsh7th/cmp-buffer", 
      "hrsh7th/cmp-path", 
      "L3MON4D3/LuaSnip",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config('*', { capabilities = capabilities })

      -- Specific configuration for rust_analyzer
      vim.lsp.config('rust_analyzer', {
        settings = {
          ["rust-analyzer"] = {
            -- Tell it to attach to files even if there's no Cargo.toml
            linkedProjects = {},
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          }
        },
        -- Fallback to the current file's directory if no Cargo.toml or git root is found
        root_markers = { "Cargo.toml", "rust-project.json", ".git" },
      })

      vim.lsp.config('cmake', {
        cmd = { vim.env.HOME .. "/.local/share/nvim/uv-lsps/.venv/bin/cmake-language-server" },
      })

      vim.lsp.enable({ 'clangd', 'rust_analyzer', 'pyright', 'html', 'cmake' })
    end
  }
}
