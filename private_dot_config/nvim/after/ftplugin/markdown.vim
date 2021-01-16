" Highlight the line cursor is on
set cursorline

" Hide and format markdown elements like **bold**
set conceallevel=2

" Spell check to US English
setlocal spell spelllang=en_us

" Rebind CTRL+G to open Goyo
nnoremap <silent><C-g> :Goyo<CR>
" Wordwrap with goyo
set textwidth=79

" Markdown headings
" Modified from junegunn's dotfiles
nnoremap <leader>1 m`^i# <esc>``2l
nnoremap <leader>2 m`^i## <esc>``3l
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l
