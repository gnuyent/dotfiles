local map = vim.api.nvim_set_keymap

-- Bind backspace to C-^ (last buffer)
-- equivalent to nnoremap <BS> <C-^>
map('n', '<BS>', '<C-^>', { noremap = true })

-- Center next/previous search with zz
-- equivalent to nnoremap N(n) N(n)zz
map('n', 'N', 'Nzz', { noremap = true })
map('n', 'n', 'nzz', { noremap = true })

-- Toggle floating terminal on CTRL+Z
map('t', '<C-z>', '<C-\\><C-n>:lua require("terminal").toggle()<CR>', { noremap = true, silent = true })
map('n', '<C-z>', ':lua require("terminal").toggle()<CR>', { noremap = true, silent = true })
