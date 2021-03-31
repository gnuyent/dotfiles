local M = {}

function M.config()
  local g = vim.g
  local go = vim.o
  local bo = vim.bo
  local wo = vim.wo
  local cmd = vim.api.nvim_command

  g.coc_global_extensions = {'coc-json'}
end

return M
