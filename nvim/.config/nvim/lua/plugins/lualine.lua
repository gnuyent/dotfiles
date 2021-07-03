  local lualine = require('lualine')

  lualine.setup {
    options = {
      theme = 'auto',
      section_separators = {'', ''},
      component_separators = {'', ''},
      icons_enabled = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff' },
      lualine_c = { 'hostname', 'filename' },
      lualine_x = { 'encoding',
        {
          'fileformat',
          icons_enabled = false,
        },
        'filetype',
        {
          'diagnostics',
          sources = { 'nvim_lsp' },
        }
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location'  },
    },
    inactive_sections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {  },
      lualine_z = {  }
    },
    extensions = { 'fugitive', 'nvim-tree' }
  }
