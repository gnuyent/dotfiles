local M = {}

function M.config()
  vim.o.background = "dark"
  vim.g.ayucolor = "dark"
  vim.cmd("colorscheme ayu")
end

return M
