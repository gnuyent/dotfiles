local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

-- Bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

execute("packadd packer.nvim")

local packer = require("packer")

-- Automatically recompile on file save.
execute("autocmd BufWritePost plugins.lua PackerCompile")

packer.init()

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true })
	use("kyazdani42/nvim-web-devicons")
	use({ "shadmansaleh/lualine.nvim", config = [[require("config.lualine")]] }) -- FIXME: Use fork while master isn't active
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require("config.indent-blankline")]],
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"romgrk/nvim-treesitter-context",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		run = ":TSUpdate",
		config = [[require("treesitter")]],
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
		config = [[require("config.telescope")]],
	})
	use("tpope/vim-commentary")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = [[require("config.null-ls")]],
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = [[require("neogit").setup({})]],
	})
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"kabouzeid/nvim-lspinstall",
		},
		config = [[require("lsp")]],
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = [[require("gitsigns").setup({keymaps={}})]],
	})
	use("ggandor/lightspeed.nvim")
	use("Pocco81/Catppuccino.nvim")
	use({
		"simrat39/symbols-outline.nvim",
		config = [[require("config.symbols-outline")]],
	})
	use({
		"luukvbaal/nnn.nvim",
		config = [[require("nnn").setup()]],
	})
	use({
		"windwp/nvim-autopairs",
		config = [[require("nvim-autopairs").setup()]],
	})
	use({ "folke/which-key.nvim", config = [[require("config.which-key")]] })
end)
