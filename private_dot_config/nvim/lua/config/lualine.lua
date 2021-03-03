local lualine = require('lualine')

lualine.options.theme = 'ayu_dark'
lualine.options.section_separators = nil
lualine.options.component_separators = nil

lualine.sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch',
    {
      'diff',
      color_added = "#91B362",
      color_modified = "#6994BF",
      color_removed = "#D96C75"
    },
  },
  lualine_c = { 'filename' },
  lualine_x = { 'encoding', 'fileformat', 'filetype',
    {
      'diagnostics',
      sources = { 'nvim_lsp' }
    }
  },
  lualine_y = { 'progress' },
  lualine_z = { 'location'  },
}

lualine.inactive_sections = {
  lualine_a = {  },
  lualine_b = {  },
  lualine_c = { 'filename' },
  lualine_x = { 'location' },
  lualine_y = {  },
  lualine_z = {  }
}

lualine.status()
