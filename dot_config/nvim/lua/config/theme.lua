local catppuccin = require("catppuccin")

vim.o.termguicolors = true
vim.cmd("set background=dark")
catppuccin.setup({
	styles = {
		strings = "NONE",
		comments = "NONE",
		keywords = "bold",
		functions = "bold",
		variables = "bold",
	},
	integrations = {
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "bold",
				hints = "bold",
				warnings = "bold",
				information = "NONE",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		gitsigns = true,
		telescope = true,
		which_key = true,
		neogit = true,
		ts_rainbow = true,
		hop = true,
	},
})
vim.cmd("colorscheme catppuccin")
