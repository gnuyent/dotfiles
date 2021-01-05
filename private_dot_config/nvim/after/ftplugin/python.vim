" <LEADER>+F bind for organizing imports and running formatters
nnoremap <silent> <leader>f :CocCommand pyright.organizeimports<CR>

setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldnestmax=2
