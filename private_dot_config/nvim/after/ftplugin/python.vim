" <LEADER>+F bind for organizing imports and running formatters
nnoremap <silent> <leader>f :CocCommand pyright.organizeimports<CR>

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldnestmax=2
