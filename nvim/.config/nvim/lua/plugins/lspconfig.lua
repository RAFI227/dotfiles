return
{
  {
    {
      "mason-org/mason.nvim",
      opts = {},
      config = function()
        --require("mason").setup()
        require("mason").setup({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        })
      end
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        auto_install = true
      }
    end
  },
  {
      "seblyng/roslyn.nvim",
      --config = function()
      --  vim.lsp.config("roslyn", {
      --    filetypes = "cs"
      --  })
      --end,
      ---@module 'roslyn.config'
      ---@type RoslynNvimConfig
      opts = {
      },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
        -- local lspconfig = require("lspconfig")
      vim.lsp.config("lua_ls", {
          capabilities = capabilities
        })
      vim.lsp.enable ("lua_ls")
      vim.lsp.enable("roslyn")

      vim.keymap.set('n', '<Leader>ch', vim.lsp.buf.hover, {desc = "Go to hover info"})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
    end
  }
}
