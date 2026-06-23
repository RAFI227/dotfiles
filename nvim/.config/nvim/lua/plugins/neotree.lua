return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  enable = false,
  opts = {
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
      }
    }
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>',{})
  end,
}
