local map = vim.api.nvim_set_keymap

local noremap = { noremap = true }
local opts = { noremap = true, silent = true }

-- Bind backspace to C-^ (last buffer)
map('n', '<BS>', '<C-^>', noremap)

-- Center next/previous search with zz
map('n', 'N', 'Nzz', noremap)
map('n', 'n', 'nzz', noremap)

--- Doom-like tabs
-- New tab
map('n', '<leader><tab>n', ':tabnew<CR>', opts)
map('n', '<C-t>', ':tabnew<CR>', opts)
-- Delete this tab
map('n', '<leader><tab>d', ':tabclose<CR>', opts)

--- Terminal
-- Open terminal
map('n', '<leader>oT', ':terminal<CR>', opts)

-- Exit terminal 'insert' mode faster
map('t', '<esc>', '<C-\\><C-n>', opts)

--- Switch splits with <C-{hjkl}>
map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)
