return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = { -- :h background
          light = "latte",
          dark = "mocha",
      },
      default_integrations = true,
      auto_integrations = false,
      integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          notify = true,
          mini = {
              enabled = true,
              indentscope_color = "",
          },
      },
      --color_overrides = {
      --  macchiato = {
      --    base = "#000000",      -- main editor bg
      --    mantle ="#777777",    -- statusline, tabline, etc. darker layer
      --    crust ="#777777",     -- even deeper (borders, some floats)
      --  }
      --}
    })
    --vim.cmd.colorscheme "catppuccin-nvim"
    --vim.api.nvim_set_hl(0, "Normal",   { bg = "#000000" })
    --vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
  end
}
