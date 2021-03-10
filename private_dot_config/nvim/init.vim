" Bind leader key to space
let mapleader = " "

" VSCode Compatability
if exists('g:vscode')
	" Center next/previous search with zz
	nnoremap n nzz
	nnoremap N Nzz

	" Rename
	nnoremap <silent> <leader>rn <CMD>call VSCodeNotify('editor.action.rename')<CR>

elseif has('nvim-0.5')
	runtime! packer/packer_compiled.vim
lua << EOF
	require 'init'
EOF
endif
