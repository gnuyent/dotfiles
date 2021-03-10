local setup = function()
  -- Load options
  require'options'

  -- Load keybinds
  require'keybinds'

  -- Load floating terminal
  require'terminal'

  -- Load plugins and configurations
  require'plugins'
end

setup()
