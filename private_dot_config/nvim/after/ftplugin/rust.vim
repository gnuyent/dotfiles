set smartindent

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
