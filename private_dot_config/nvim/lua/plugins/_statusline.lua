local M = {}

function M.config()
  local lualine = require('lualine')

  lualine.setup {
    options = {
      theme = 'ayu_dark',
      section_separators = {'', ''},
      component_separators = {'', ''},
      icons_enabled = true,
    },
    sections = {
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
          sources = { 'nvim_lsp' },
          color_info = "#53bdfa",
          color_error = "#ea6c73",
          color_warn = "#f9af4f"
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
    extensions = { 'nvim-tree' }
  }
end

return M
