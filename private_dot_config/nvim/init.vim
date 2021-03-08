" Bind leader key to space
let mapleader = " "

if exists('g:vscode')
elseif has('nvim-0.5')
	runtime! packer/packer_compiled.vim
lua << EOF
	require 'init'
EOF
endif
