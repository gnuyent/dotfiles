set smartindent

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting(nil, 1000)
