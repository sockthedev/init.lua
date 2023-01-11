local plugin = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  lazy = true,
  init = function()
    local u = require("utils.keymaps")

    u.set_keymaps("n", {
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
          local condition = vim.fn.input("Breakpoint condition: ")
          local hit_condition = vim.fn.input("Breakpoint hit condition: ")
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
    })
  end,
  config = function()
    require("plugins.dap.base")
  end,
}

return plugin
