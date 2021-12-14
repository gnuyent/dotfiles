local packer = require("packer")

-- Automatically recompile on file save.
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

packer.init({
	git = { clone_timeout = 300 },
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	--- Essentials
	-- Plugin Manager
	use({ "wbthomason/packer.nvim" })
	-- Fennel Configuration
	use({
		"rktjmp/hotpot.nvim",
		-- packer says this is "code to run after this plugin is loaded."
		-- but it seems to run before plugin/hotpot.vim (perhaps just barely)
		config = [[require("hotpot")]],
	})
	use({ "tsbohc/zest.nvim", config = [[require("zest").setup()]] })
	--- Aesthetic
	-- Icons
	use({ "kyazdani42/nvim-web-devicons" })
	-- Colorscheme
	use({ "Shatur/neovim-ayu", config = [[require("config.theme")]] })
	-- Statusline
	use({ "nvim-lualine/lualine.nvim", config = [[require("config.lualine")]] })
	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = [[require("config.treesitter")]],
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "romgrk/nvim-treesitter-context", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" })
	-- Indent Guides
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require("config.indent-blankline")]],
	})
	-- Code Action Menu
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	--- Actions
	use({
		"folke/which-key.nvim",
		config = [[require("config.which-key")]],
		event = "BufWinEnter",
	})
	use({ "phaazon/hop.nvim", config = [[require("config.hop")]] })
	use({ "numToStr/Comment.nvim", config = [[ require("Comment").setup()]] })
	use({
		"windwp/nvim-autopairs",
		config = [[require("nvim-autopairs").setup()]],
	})

	--- Integration
	-- nnn
	use({
		"luukvbaal/nnn.nvim",
		config = [[require("nnn").setup()]],
	})
	-- Git
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = [[require("neogit").setup({})]],
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = [[require("gitsigns").setup({keymaps={}})]],
		event = "BufRead",
	})
	use({ "kdheepak/lazygit.nvim", after = "which-key.nvim" })

	--- Language Server Protocol (LSP)
	-- Configuration
	use({ "neovim/nvim-lspconfig", config = [[require("config.lsp")]], after = "which-key.nvim" })
	-- Non-LSP integration
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "jose-elias-alvarez/null-ls.nvim" })
	-- Completion Engine
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- LSP Server Installer
	use("williamboman/nvim-lsp-installer")

	--- Files and Directories
	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = [[require("config.telescope")]],
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Symbol Outline
	use({
		"simrat39/symbols-outline.nvim",
		config = [[require("config.symbols-outline")]],
	})

	--- Debugging
	use("mfussenegger/nvim-dap")
	use("Pocco81/DAPInstall.nvim")
	use({
		"rcarriga/nvim-dap-ui",
		config = [[require("config.dap")]],
	})
end)
