return {
  {
  "akinsho/bufferline.nvim",
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
    vim.keymap.set('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
    local bufferline = require('bufferline')
    bufferline.setup {
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            --style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
            themable = true,
            --numbers = "none" | "ordinal" | "buffer_id" | "both",
            numbers = "none",
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon',
            },
            buffer_close_icon = '󰅖',
            modified_icon = '● ',
            close_icon = ' ',
            left_trunc_marker = ' ',
            right_trunc_marker = ' ',
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will *NOT* be fixed.
            --diagnostics = false | "nvim_lsp" | "coc",
            diagnostics = "nvim_lsp",
            diagnostics_update_on_event = true, -- use nvim's diagnostic handler
            -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return "("..count..")"
            end,
            -- NOTE: this will be called a lot so don't do any heavy processing here
            --color_icons = true | false, -- whether or not to add the filetype icon highlights
            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            show_duplicate_prefix = true,
            duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = "slant",
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            auto_toggle_bufferline = true,
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
            sort_by = 'insert_after_current',
            pick = {
              alphabet = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890",
            },
        }
    }
    end
  },
  {
    "tiagovla/scope.nvim",
    config = true,
  }
}
