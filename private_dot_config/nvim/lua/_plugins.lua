local execute = vim.api.nvim_command
local fn = vim.fn

-- Bootstrap packer.
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

execute 'packadd packer.nvim'

-- Automatically recompile on file save.
execute('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  ----------------------------------------
  -- tmux + nvim
  ----------------------------------------
  use {'christoomey/vim-tmux-navigator'}

  use {
    'RyanMillerC/better-vim-tmux-resizer',
    config = [[require('config.vim-tmux-navigator')]]
  }

  ----------------------------------------
  -- Visuals
  ----------------------------------------
  use {
    'Luxed/ayu-vim',
    config = [[require('config.ayu')]]
  }

  use {'kyazdani42/nvim-web-devicons'}

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = [[require('config.lualine')]]
  }

  use {'psliwka/vim-smoothie'}

  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    config = [[require('config.indent-blankline')]]
  }

  ----------------------------------------
  -- Completion
  ----------------------------------------
  use {
    'neovim/nvim-lspconfig',
    config = [[require('config.nvim-lsp')]]
  }

  use {
    'hrsh7th/nvim-compe',
    requires = {
      {'hrsh7th/vim-vsnip'}
    },
    config = [[require('config.nvim-compe')]]
  }

  use {
    'glepnir/lspsaga.nvim',
    config = [[require('config.lspsaga')]]
  }

  ----------------------------------------
  -- Utilities
  ----------------------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require('config.telescope')]]
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.treesitter')]],
    run = ':TSUpdate'
  }

  use {
    'liuchengxu/vista.vim',
    config = [[require('config.vista')]]
  }

  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()',
    config = [[require('config.doge')]]
  }

  use {'tpope/vim-fugitive'}
end)
