set smartindent

nnoremap <silent> <leader>f <CMD>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>
