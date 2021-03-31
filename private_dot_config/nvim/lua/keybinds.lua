local map = vim.api.nvim_set_keymap

local noremap = { noremap = true }
local opts = { noremap = true, silent = true }

-- Bind backspace to C-^ (last buffer)
map('n', '<BS>', '<C-^>', noremap)

-- Center next/previous search with zz
map('n', 'N', 'Nzz', noremap)
map('n', 'n', 'nzz', noremap)
