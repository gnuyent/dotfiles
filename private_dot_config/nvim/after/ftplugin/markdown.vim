" Highlight the line cursor is on
set cursorline

" Spell check to US English
setlocal spell spelllang=en_us

" Rebind CTRL+G to open Goyo
nnoremap <silent><leader>g :Goyo<CR>
" Wordwrap with goyo
set wrap
set linebreak

" Markdown headings
" Modified from junegunn's dotfiles
nnoremap <leader>1 m`^i# <esc>``2l
nnoremap <leader>2 m`^i## <esc>``3l
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l

" Goyo/Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Fix indentation
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
