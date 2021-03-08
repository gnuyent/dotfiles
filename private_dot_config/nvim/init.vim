" Bind leader key to space
let mapleader = " "

if exists('g:vscode')
	nnoremap <silent> <C-z> <CMD>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>
	nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
elseif has('nvim-0.5')
	runtime! packer/packer_compiled.vim
lua << EOF
	require 'init'
EOF
endif
