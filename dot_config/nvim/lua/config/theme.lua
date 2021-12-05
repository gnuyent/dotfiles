local onedarkpro = require("onedarkpro")

vim.o.termguicolors = true
vim.cmd("set background=dark")
onedarkpro.setup({
	styles = {
		strings = "NONE",
		comments = "NONE",
		keywords = "bold",
		functions = "bold",
		variables = "bold",
	},
	options = {
		italic = false,
	},
})
onedarkpro.load()
