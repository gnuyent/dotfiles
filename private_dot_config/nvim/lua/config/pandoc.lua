vim.g['pandoc#modules#disabled'] = {'folding'}
-- <leader>p to generate PDF.
vim.api.nvim_set_keymap('n', '<leader>p', '<CMD>Pandoc! pdf<CR>', { noremap = true, silent = true })

-- vim-pandoc-syntax
vim.g['pandoc#syntax#conceal#urls'] = 1
