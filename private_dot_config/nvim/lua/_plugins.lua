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
  use {'sainnhe/gruvbox-material'}

  use {'kyazdani42/nvim-web-devicons'}

  use {
    'glepnir/galaxyline.nvim',
    config = [[require('config.galaxyline')]]
  }

  use {'psliwka/vim-smoothie'}

  use {
    'glepnir/indent-guides.nvim',
    config = [[require('config.indent-guides')]]
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

  use {'mhinz/vim-signify'}

  ----------------------------------------
  -- Markdown/Notetaking
  ----------------------------------------
  use {
    'lervag/wiki.vim',
    config = [[require('config.wiki')]],
    ft = {'markdown', 'pandoc'}
  }

  use {
    'vim-pandoc/vim-pandoc',
    config = [[require('config.pandoc')]],
    ft = {'markdown', 'pandoc'}
  }

  use {
    'vim-pandoc/vim-pandoc-syntax',
    config = [[require('config.pandoc')]],
    ft = {'markdown', 'pandoc'}
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = [[require('config.markdown-preview')]],
    ft = {'markdown', 'pandoc'}
  }
end)
