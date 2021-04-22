local M = {}

function M.config()
  vim.g.indent_blankline_show_first_indent_level = false

  vim.g.indent_blankline_filetype_exclude = {
    'help',
    'lspinfo',
    'markdown',
    'pandoc',
    'packer',
    'sagahover',
    'vista'
  }
end

return M
