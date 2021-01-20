-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

-- Automatically recompile on file save
execute('autocmd BufWritePost plugins.lua PackerCompile')

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	use {'christoomey/vim-tmux-navigator'}

	use {
		'hoob3rt/lualine.nvim',
		requires = {
			{'kyazdani42/nvim-web-devicons', opt=true}
		},
    config = function()
      local lualine = require("lualine")
      lualine.theme = 'forest_night'
      lualine.status()
    end
	}

	use {
		'junegunn/fzf',
		run = ":call fzf#install()",
	}

	use {'junegunn/fzf.vim'}

	use {
		'kkoomen/vim-doge',
		run = ':call doge#install()',
    config = function()
      vim.g.doge_doc_standard_python = 'google'
    end
	}

	use {
    'liuchengxu/vista.vim',
    config = function()
      -- Executive used when opening vista sidebar without specifying it.
      -- See all the avaliable executives via `:echo g:vista#executives`.
      vim.g.vista_default_executive = 'coc'

      -- Set the executive for some filetypes explicitly. Use the explicit executive
      -- instead of the default one for these filetypes when using `:Vista` without
      -- specifying the executive.
      vim.g.vista_executive_for = {
       python = 'coc',
      }

      -- Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
      vim.g['vista#renderer#enable_icon'] = 1

      -- Don't navigate to vista window on open
      vim.g.vista_stay_on_open = 0

      -- Decrease delay
      vim.g.vista_update_on_text_changed_delay = 100

      -- Vista hotkey
      vim.api.nvim_set_keymap('n', '<leader>v', '<CMD>Vista!!<CR>', { noremap = true, silent = true })
    end
  }

	use {'melonmanchan/vim-tmux-resizer'}

	use {'neoclide/coc.nvim'}

	use {'antoinemadec/coc-fzf'}

	use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local ts_cfg = require("nvim-treesitter.configs")

      ts_cfg.setup {
          ensure_installed = "maintained",
          highlight = {
        enable = true,
        use_languagetree = true,
          },
          indent = {
        enable = true,
          }
      }
    end
  }

	use {'psliwka/vim-smoothie'}

	use {'rhysd/vim-clang-format'}

	use {'sainnhe/forest-night'}

  -- Snippets
  use {'honza/vim-snippets'}

  -- Markdown
  use {
    'junegunn/goyo.vim',
    ft = {'markdown'}
  }

  use {
    'junegunn/limelight.vim',
    ft = {'markdown'}
  }

  use {
    'lervag/wiki.vim',
    config = function()
      vim.g.wiki_root = '~/notes'
      vim.g.wiki_filetypes = {'md'}
      vim.g.wiki_link_extension = '.md'
      vim.g.wiki_link_target_type = 'md'
    end
  }
end)
