return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  -- config = function()
  --   local config = require("nvim-treesitter.configs")
  --   config.setup({
  --     ensure_installed = {"vim", "vimdoc", "lua", "python", "c_sharp"},
  --     highlight = { enable = true},
  --     indent = { enable = true},
  --   })
  -- end
}
