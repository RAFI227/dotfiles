return {
  {
    "ownself/nvim-dap-unity",
    dependencies = { "mfussenegger/nvim-dap" },
    build = function()
      require("nvim-dap-unity").install()
    end,
    config = function()
      require("nvim-dap-unity").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python"
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      require("dapui").setup()
      --C#
      dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = { '--interpreter=vscode' }
      }
      dap.configurations.cs = {
        {
            type = "coreclr",
            name = "launch - netcoredbg",
            request = "launch",
            program = function()
              return vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
            end,
        },
      }
      vim.keymap.set('n', '<Leader>cg', function()
        vim.lsp.buf.signature_help()
      end, { desc = "Toggle signature help" })
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)

      --C / C++ 
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
      }

      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          args = {}, -- provide arguments if needed
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
        {
          name = "Select and attach to process",
          type = "gdb",
          request = "attach",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
          end,
          cwd = '${workspaceFolder}'
        },
        {
          name = 'Attach to gdbserver :1234',
          type = 'gdb',
          request = 'attach',
          target = 'localhost:1234',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}'
        }
      }
      dap.configurations.cpp = dap.configurations.c
      
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        -- dapui.close()
      end

      vim.keymap.set('n', '<F4>', function() require('dap').terminate() end)
      vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, {desc = "Toggle breakpoint"})
      vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end, {desc = "Toggle ui"})
    end
  },
}
