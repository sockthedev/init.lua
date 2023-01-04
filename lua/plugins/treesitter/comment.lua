require("comment").setup({
  pre_hook = function(ctx)
    -- only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" then
      local u = require("comment.utils")

      -- detemine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == u.ctype.line and "__default" or "__multiline"

      -- determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == u.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == u.cmotion.v or ctx.cmotion == u.cmotion.v then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring({
        key = type,
        location = location,
      })
    end
  end,
})

