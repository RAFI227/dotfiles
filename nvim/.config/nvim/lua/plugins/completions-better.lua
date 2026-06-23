return {
  {
    'saghen/blink.cmp',
    version = '*', -- use a release tag for pre-built binaries
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      keymap = {
        preset = 'default',
      },
      appearance = {
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lsp = {
            name = "lsp",
            enabled = true,
            async=true,
          }
        }
      },
      completion = {
        list = {
          selection = {preselect = true, auto_insert=true}
        },
        ghost_text = {
          enabled = true,
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        use_proximity = true,
      }
    },
  }
}
