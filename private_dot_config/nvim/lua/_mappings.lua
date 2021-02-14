local remap = vim.api.nvim_set_keymap

-- Bind backspace to C-^ (last buffer)
-- equivalent to nnoremap <BS> <C-^>
remap('n', '<BS>', '<C-^>', { noremap = true })

-- Center next/previous search with zz
-- equivalent to nnoremap N(n) N(n)zz
remap('n', 'N', 'Nzz', { noremap = true })
remap('n', 'n', 'nzz', { noremap = true })

-- Set paste toggle to F2
vim.o.pastetoggle = '<F2>'

-- Toggle floating terminal on CTRL+Z
remap('t', '<C-z>', '<C-\\><C-n>:lua require("_terminal").toggle()<CR>', { noremap = true, silent = true })
remap('n', '<C-z>', ':lua require("_terminal").toggle()<CR>', { noremap = true, silent = true })
