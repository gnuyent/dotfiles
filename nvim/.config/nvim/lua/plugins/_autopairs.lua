local M = {}

function M.config()
  local npairs = require('nvim-autopairs')
  npairs.setup()
  vim.g.completion_confirm_key = ""

  function _G.completion_confirm()
    if vim.fn.pumvisible() ~= 0  then
      if vim.fn.complete_info()["selected"] ~= -1 then
        vim.fn["compe#confirm"]()
        return npairs.esc("<c-y>")
      else
        vim.defer_fn(function()
          vim.fn["compe#confirm"]("<cr>")
        end, 20)
        return npairs.esc("<c-n>")
      end
    else
      return npairs.check_break_line_char()
    end
  end
end

return M
