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
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lualine/lualine.nvim", config = [[require("config.lualine")]] })
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require("config.indent-blankline")]],
	})
	-- Treesitter --
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = [[require("config.treesitter")]],
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "romgrk/nvim-treesitter-context", requires = "nvim-treesitter/nvim-treesitter" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter" })
	-- Telescope --
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = [[require("config.telescope")]],
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = [[require("config.lsp")]],
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = [[require("config.null-ls")]],
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "jose-elias-alvarez/null-ls.nvim" })
	-- nvim-cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("williamboman/nvim-lsp-installer")
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
	})
	use({ "ggandor/lightspeed.nvim" })
	use({
		"simrat39/symbols-outline.nvim",
		config = [[require("config.symbols-outline")]],
	})
	use({
		"luukvbaal/nnn.nvim",
		config = [[require("nnn").setup()]],
		commit = "8304de7f2f4dce741c8cf1e2272efaeddb643c98",
	})
	use({
		"windwp/nvim-autopairs",
		config = [[require("nvim-autopairs").setup()]],
	})
	use({ "folke/which-key.nvim", config = [[require("config.which-key")]] })
	use({ "numToStr/Comment.nvim", config = [[ require("Comment").setup()]] })
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "Pocco81/Catppuccino.nvim", config = [[require("config.theme")]] })
end)
