local remap = vim.api.nvim_set_keymap

-- Bind backspace to C-^ (last buffer)
-- equivalent to nnoremap <BS> <C-^>
remap('n', '<BS>', '<C-^>', { noremap = true })

-- Center next/previous search with zz
-- equivalent to nnoremap N(n) N(n)zz
remap('n', 'N', 'Nzz', { noremap = true })
remap('n', 'n', 'nzz', { noremap = true })

-- Set paste toggle to F2
vim.cmd('set pastetoggle=<F2>')
