-- CTRL+p to toggle markdown preview.
-- Note: calling <Plug>MarkdownPreviewToggle doesn't seem to work...
vim.api.nvim_set_keymap('n', '<C-p>', '<CMD>call mkdp#util#toggle_preview()<CR>', { noremap = true, silent = true })
vim.g.mkdp_filetypes = {'markdown', 'pandoc'}
