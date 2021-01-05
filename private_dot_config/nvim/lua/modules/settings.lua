local cmd = vim.api.nvim_command

local apply_options = function(opts)
  for k, v in pairs(opts) do
    if v == true then
      cmd('set ' .. k)
    elseif v == false then
      cmd(string.format('set no%s', k))
    else
      cmd(string.format('set %s=%s', k, v))
    end
  end
end

-- Hybrid relative line numbers
cmd("augroup numbertoggle")
cmd("autocmd!")
cmd("autocmd BufEnter,FocusGained,InsertLeave * set relativenumber")
cmd("autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber")
cmd("augroup END")

local options = {
  -- Boolean values
  autowrite = true, -- Automatically write buffers when not focused
  hidden = true, -- TextEdit might fail if hidden is not set

  ignorecase = true, -- case insensitive on search
  smartcase = true, -- unless there is a capital in the search

  number = true, -- line numbers
  relativenumber = true, -- relative line numbers

  termguicolors = true, -- true colors
  wrap = false, -- disable line wrapping

  backup = false, -- disable backup
  writebackup = false, -- disable write backup

  -- String values
  encoding = "UTF-8", -- set encoding to UTF-8
  mouse = "a", -- Enable mouse mode
  signcolumn = "number", -- Merge signcolumn and number column

  -- Number values
  cmdheight = 1, -- Space for message displays
  updatetime = 200, -- 200ms
}

cmd("colorscheme forest-night")
-- Filetype plugins
cmd("filetype plugin indent on")

apply_options(options)
