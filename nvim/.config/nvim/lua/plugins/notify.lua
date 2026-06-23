return {
  'rcarriga/nvim-notify',
  opts = {
    position = "bottom_right",
    timeout = 1000,
  },
  config = function()
    vim.keymap.set("n", "<Esc>", function()
    require("notify").dismiss()
    end, { desc = "Dismiss notify popup" })
  end
}

