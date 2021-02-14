local gl = require('galaxyline')
local gls = gl.section
local cmd = vim.api.nvim_command
local my_icons = require('galaxyline.provider_fileinfo').define_file_icon()

gl.short_line_list = {'vista', 'vista_kind', 'packer'}

my_icons['packer'] = {'#D2B48C', ''}

local colors = {
  bg = "#282828",
  black = "#665C54",
  blue = "#7DAEA3",
  brightBlack = "#928374",
  brightBlue = "#7DAEA3",
  brightCyan = "#89B482",
  brightGreen = "#A9B665",
  brightPurple = "#D3869B",
  brightRed = "#EA6962",
  brightWhite = "#D4BE98",
  brightYellow = "#D8A657",
  cyan = "#89B482",
  fg = "#D4BE98",
  green = "#A9B665",
  purple = "#D3869B",
  red = "#EA6962",
  white = "#D4BE98",
  yellow = "#D8A657"
}

-- Helper Functions
local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

-- auto change color according the vim mode
-- TODO: maybe add more modes?
local mode_color = function()
  local mode_colors = {
    n = colors.fg,
    i = colors.blue,
    v = colors.orange, [''] = colors.orange, V = colors.orange,
    c = colors.green,
    R = colors.red,
    t = colors.cyan
  }

  mode_color = mode_colors[vim.fn.mode()]
  if mode_color ~= nil then
    return mode_color
  end
  return colors.purple
end

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local file_readonly = function()
  if vim.bo.filetype == 'help' then return '' end
  if vim.bo.readonly == true then return '  ' end
  return ''
end

local get_current_file_name = function()
    local file = vim.fn.expand('%:t')
    if vim.fn.empty(file) == 1 then return '' end
    if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
    if vim.bo.modifiable then
        if vim.bo.modified then return file .. '  ' end
    end
    return file .. ' '
end

-- Left Half
gls.left[1] = {
  ViMode = {
    provider = function()
      local aliases = {
        n = 'NORMAL',
        i = 'INSERT',
        v = 'VISUAL',
        V = 'V-LINE',
        [''] = 'V-BLOCK',
        c = 'COMMAND',
        s = 'SELECT',
        S = 'S-LINE',
        [''] = 'S-BLOCK',
        R = 'REPLACE',
        t = 'TERMINAL',
        l = 'LUA'
      }

      cmd('hi GalaxyViMode guibg=' .. mode_color())

      alias = aliases[vim.fn.mode()]
      local mode = ""
      if alias ~= nil then
        if checkwidth() then
          mode = alias
        else
          mode = alias:sub(1, 1)
        end
      else
        mode = vim.fn.mode()
      end
      return '  ' .. mode .. ' '
    end,
    highlight = {colors.bg, colors.bg, 'bold'}
  },
}

gls.left[2] ={
  FileIcon = {
    provider = {function() return '  ' end, 'FileIcon'},
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg},
  },
}

gls.left[3] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.bg, 'bold'}
  }
}

gls.left[4] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.section_bg, colors.bg}
    }
}

-- Right Half
gls.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.right[3] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.right[4] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[5] = {
  GitIcon = {
    provider = function() return '   ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.fg, colors.bg, 'bold'},
  }
}

gls.right[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.fg, colors.bg, 'bold'},
  }
}

gls.right[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = '  +',
    highlight = {colors.green,colors.bg},
  }
}

gls.right[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ~',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.right[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' -',
    highlight = {colors.red,colors.bg},
  }
}

gls.right[10] = {
  FileEncode = {
    provider = 'FileEncode',
    highlight = {colors.brightBlack,colors.bg,'bold'}
  }
}

gls.right[11] = {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.brightBlack, colors.bg, 'bold'}
  }
}

gls.right[12] = {
  LineInfo = {
    provider = {function() return ' ' end, 'LineColumn', function() return ' ' end},
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.bg, colors.blue},
  },
}

-- Inactive panes
gls.short_line_left[1] ={
  FileIcon = {
    provider = {function() return '  ' end, 'FileIcon'},
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.short_line_left[2] = {
  FileName = {
    provider = 'FileName',
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.bg, 'bold'}
  }
}
