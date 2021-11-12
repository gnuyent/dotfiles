local buffer = vim.api.nvim_buf_set_option
local window = vim.api.nvim_win_set_option
-- Use 2 spaces over tabs
buffer(0, "tabstop", 2)
buffer(0, "shiftwidth", 2)
buffer(0, "expandtab", true)
buffer(0, "smartindent", true)
-- Ruler at 80 cols
window(0, "colorcolumn", "80")
