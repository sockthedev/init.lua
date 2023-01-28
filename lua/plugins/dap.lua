return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    lazy = true,
    keys = {
      {
        "<Leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        "Breakpoint",
      },
      {
        "<Leader>dB",
        function()
          ---@diagnostic disable-next-line: param-type-mismatch
          local condition = vim.fn.input("Breakpoint condition: ")
          ---@diagnostic disable-next-line: param-type-mismatch
          local hit_condition = vim.fn.input("Breakpoint hit condition: ")
          ---@diagnostic disable-next-line: param-type-mismatch
          local log_message = vim.fn.input("Breakpoint log message: ")
          require("dap").set_breakpoint(condition, hit_condition, log_message)
        end,
        "Conditional Breakpoint",
      },
      {
        "<Leader>dc",
        function()
          require("dap").continue()
        end,
        "Continue",
      },
      {
        "<Leader>dp",
        function()
          require("dap").pause()
        end,
        "Pause",
      },
      {
        "<Leader>dt",
        function()
          require("dap").terminate()
        end,
        "Terminate",
      },
      {
        "<Leader>di",
        function()
          require("dap").step_into()
        end,
        "Step Into",
      },
      {
        "<Leader>do",
        function()
          require("dap").step_out()
        end,
        "Step Out",
      },
      {
        "<Leader>dO",
        function()
          require("dap").step_over()
        end,
        "Step Over",
      },
      {
        "<Leader>drc",
        function()
          require("dap").run_to_cursor()
        end,
        "Run to Cursor",
      },
      {
        "<Leader>dh",
        function()
          ---@diagnostic disable-next-line: missing-parameter
          require("dapui").eval()
        end,
        "Eval",
      },
    },
    config = function()
      local dap = require("dap")
      local dap_ui = require("dapui")
      local dap_vt = require("nvim-dap-virtual-text")

      dap_vt.setup({
        enabled = true,
        enable_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = false,
        all_references = false,
        filter_references_pattern = "<module",
        virt_text_pos = "eol",
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil,
      })

      dap_ui.setup({
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        -- Expand lines larger than the window
        expand_lines = true,
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
          {
            elements = {
              -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        dap_ui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        dap_ui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        dap_ui.close()
      end

      require("plugins.dap.javascript")
    end,
  },
  {
    "jayp0521/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "node2", "chrome" },
      })
    end,
  },
}
