vim.g.mapleader = ' '

if vim.g.vscode then
  require 'vscode'
else
  vim.cmd('runtime! packer/packer_compiled.vim')
  require 'init'
end
