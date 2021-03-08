" Bind leader key to space
let g:mapleader=" "

if exists('g:vscode')
	" Center next/previous search
	nnoremap N Nzz
	nnoremap n nzz
else
lua << EOF
	require 'init'
EOF
endif
