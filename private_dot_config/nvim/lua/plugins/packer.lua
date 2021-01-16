-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	use {'christoomey/vim-tmux-navigator'}
	use {
		'hoob3rt/lualine.nvim',
		requires = {
			{'kyazdani42/nvim-web-devicons', opt=true}
		}
	}
	use {
		'junegunn/fzf',
		run = ":call fzf#install()",
	}
	use {'junegunn/fzf.vim'}
	use {
		'kkoomen/vim-doge',
		run = ':call doge#install()',
	}
	use {'liuchengxu/vista.vim'}
	use {'melonmanchan/vim-tmux-resizer'}
	use {'neoclide/coc.nvim'}
	use {'antoinemadec/coc-fzf'}
	use {'nvim-treesitter/nvim-treesitter'}
	use {'psliwka/vim-smoothie'}
	use {'rhysd/vim-clang-format'}
	use {'sainnhe/forest-night'}

  -- Markdown
  use {'junegunn/goyo.vim'}
  use {'vimwiki/vimwiki'}
end)
