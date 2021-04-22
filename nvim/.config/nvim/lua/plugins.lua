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

local packer = require('packer')
local util = require('packer.util')

-- Use nvim/packer instead of nvim/plugins
packer.init {
  compile_path = util.join_paths(vim.fn.stdpath('config'), 'packer', 'packer_compiled.vim')
}

return packer.startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  ----------------------------------------
  -- Visuals
  ----------------------------------------
  -- This is a fork of the original ayu-vim theme.
  use {
    'Luxed/ayu-vim',
    config = require("plugins._theme").config,
  }

  use {'kyazdani42/nvim-web-devicons'}

  use {
    'hoob3rt/lualine.nvim',
    --'~/Projects/lualine.nvim',
    config = require("plugins._statusline").config,
  }

  use {'psliwka/vim-smoothie'}

  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    config = require("plugins._indent-blankline").config,
  }

  ----------------------------------------
  -- Completion
  ----------------------------------------
  -- neovim built-in LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      {'kabouzeid/nvim-lspinstall'},
      {
        'hrsh7th/nvim-compe',
        requires = 'hrsh7th/vim-vsnip',
        config = require("plugins._compe").config
      },
      {
        'glepnir/lspsaga.nvim',
        config = require("plugins._lspsaga").config
      },
      {
        'fatih/vim-go',
        config = require("plugins._go").config
      },
      {
        'liuchengxu/vista.vim',
        config = require("plugins._vista").config
      },
      {
        'windwp/nvim-autopairs',
        config = require("plugins._autopairs").config
      },
      {'rafamadriz/friendly-snippets'},
      {'nvim-lua/lsp_extensions.nvim'},
    },
    config = require("plugins._lspconfig").config,
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = require("plugins._coc").config,
    disable = true
  }

  ----------------------------------------
  -- Utilities
  ----------------------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    },
    config = require("plugins._telescope").config,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = require("plugins._treesitter").config,
    run = ':TSUpdate',
  }

  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()',
    config = require("plugins._doge").config,
  }

  use {
    'tpope/vim-fugitive',
    config = require("plugins._fugitive").config,
  }

  use {
    'justinmk/vim-sneak',
    config = require("plugins._sneak").config
  }

  use {
    'christoomey/vim-tmux-navigator',
    requires = 'RyanMillerC/better-vim-tmux-resizer',
    config = require("plugins._tmux").config,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = require('plugins/_tree').config,
  }

  use {'tpope/vim-commentary'}

  use {
    'dstein64/vim-startuptime',
    disable = true,
  }

  use {
    'rktjmp/lush.nvim',
    disable = true,
  }

  use {
    'junegunn/vim-easy-align',
    config = function()
      vim.cmd("xmap ga <Plug>(EasyAlign)")
      vim.cmd("nmap ga <Plug>(EasyAlign)")
    end
  }

  use {'axelf4/vim-strip-trailing-whitespace'}
end)
