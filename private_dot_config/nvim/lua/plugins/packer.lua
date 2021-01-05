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
end)
