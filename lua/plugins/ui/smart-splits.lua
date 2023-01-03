local u = require("config.utils")

-- configure
require("smart-splits").setup({
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = {
    "nofile",
    "quickfix",
    "prompt",
  },
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = { "NvimTree", "Aerial" },
  -- the default number of lines/columns to resize by at a time
  default_amount = 3,
  -- whether to wrap to opposite side when cursor is at an edge
  -- e.g. by default, moving left at the left edge will jump
  -- to the rightmost window, and vice versa, same for up/down.
  wrap_at_edge = true,
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
  -- ignore these autocmd events (via :h eventignore) while processing
  -- smart-splits.nvim computations, which involve visiting different
  -- buffers and windows. These events will be ignored during processing,
  -- and un-ignored on completed. This only applies to resize events,
  -- not cursor movement events.
  ignored_events = {
    "BufEnter",
    "WinEnter",
  },
  -- enable or disable the tmux integration
  tmux_integration = true,
  -- disable tmux navigation if current tmux pane is zoomed
  disable_tmux_nav_when_zoomed = true,
})

-- keymaps
-- On a mac you may need to do this for iterm2 support of Alt key bindings;
-- https://stackoverflow.com/a/62345230
u.set_keymaps("n", {
  { 
    "<A-h>", 
    function()
      require("smart-splits").resize_left()
    end,
    "[smart-splits] resize left",
  },
  { 
    "<A-j>", 
    function()
      require("smart-splits").resize_down()
    end,
    "[smart-splits] resize down",
  },
  { 
    "<A-k>", 
    function()
      require("smart-splits").resize_up()
    end,
    "[smart-splits] resize up",
  },
  { 
    "<A-l>", 
    function()
      require("smart-splits").resize_right()
    end,
    "[smart-splits] resize right",
  },
  { 
    "<C-h>", 
    function()
      require("smart-splits").move_cursor_left()
    end,
    "[smart-splits] move cursor left",
  },
  { 
    "<C-j>", 
    function()
      require("smart-splits").move_cursor_down()
    end,
    "[smart-splits] move cursor down",
  },
  { 
    "<C-k>", 
    function()
      require("smart-splits").move_cursor_up()
    end,
    "[smart-splits] move cursor up",
  },
  { 
    "<C-l>", 
    function()
      require("smart-splits").move_cursor_right()
    end,
    "[smart-splits] move cursor right",
  },
})
