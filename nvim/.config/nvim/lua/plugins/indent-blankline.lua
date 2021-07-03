vim.g.indent_blankline_show_first_indent_level = false

vim.cmd("highlight IndentBlanklineChar guifg=#373B41 guibg=nocombine")

vim.g.indent_blankline_filetype_exclude = {
  'help',
  'lspinfo',
  'markdown',
  'pandoc',
  'packer',
  'sagahover',
  'terminal'
}
