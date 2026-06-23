return {
  {
    'nvim-mini/mini.pairs',
    version = false,
    config = function()
      require('mini.pairs').setup()
    end
  },
 	{ 
  "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
  {
    'nvim-mini/mini.splitjoin',
    version = '*',
    opts = {
      mappings = {
        toggle = 'gS',
      }
    }
  },

}
