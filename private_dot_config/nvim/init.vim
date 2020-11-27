"         _
"  _   __(_)___ ___  __________
" | | / / / __ `__ \/ ___/ ___/
" | |/ / / / / / / / /  / /__
" |___/_/_/ /_/ /_/_/   \___/
"
" Neovim configuration in a few files.
" Author:  Brandon Nguyen <gnuyent>
" URL:     https://github.com/gnuyent/dotfiles

"
" minpac initialization
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" General Plugins
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call minpac#add('junegunn/fzf.vim')
call minpac#add('mhartington/oceanic-next')
call minpac#add('nvim-treesitter/nvim-treesitter')
call minpac#add('tpope/vim-obsession')
" Completion Plugins
call minpac#add('neoclide/coc.nvim')
call minpac#add('antoinemadec/coc-fzf')
" Language Specific Plugins
call minpac#add('kkoomen/vim-doge', { 'do': { -> doge#install() } })
call minpac#add('rhysd/vim-clang-format')
" tmux/nvim Plugins
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('melonmanchan/vim-tmux-resizer')

let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-html', 'coc-rust-analyzer']

" Enable mouse
set mouse=a

" Hybrid Relative Line Numbers
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Disable word wrapping in the middle of word
set wrap linebreak nolist

" Filetype plugins
filetype plugin indent on

" Set paste toggle key
set pastetoggle=<F2>

" Bind backspace to C-^ (last buffer)
nnoremap <BS> <C-^>

" Bind leader key to space
let mapleader = " "

" Tabs to spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" zz bindings
nnoremap N Nzz
nnoremap n nzz

" Toggle center cursor
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>
