local global = vim.api.nvim_set_option
local window = vim.api.nvim_win_set_option
-- Use 2 spaces over tabs
global("tabstop", 2)
global("shiftwidth", 2)
global("expandtab", true)
global("smartindent", true)
-- Ruler at 80 cols
window(0, "colorcolumn", "80")
