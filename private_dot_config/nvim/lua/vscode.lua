local map = vim.api.nvim_set_keymap
-- Center next/previous search with zz
-- equivalent to nnoremap N(n) N(n)zz
map('n', 'N', 'Nzz', { noremap = true })
map('n', 'n', 'nzz', { noremap = true })

-- Go to references
map('n', 'gr', ':call VSCodeNotify("editor.action.goToReferences")<CR>', { noremap = true })
-- Rename
map('n', '<leader>rn', ':call VSCodeNotify("editor.action.rename")<CR>', { noremap = true })

-- Next/Prev Diagnostic
map('n', ']g', ':call VSCodeNotify("editor.action.marker.next")<CR>', { noremap = true })
map('n', '[g', ':call VSCodeNotify("editor.action.marker.prev")<CR>', { noremap = true })
