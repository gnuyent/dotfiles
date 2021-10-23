local catppuccino = require("catppuccino")
catppuccino.setup({
	integrations = { lightspeed = true, gitsigns = true, neogit = true, which_key = true, telescope = true, indent_blankline = {enabled = true, colored_indent_levels = false} },
})
vim.o.termguicolors = true
vim.cmd("set background=dark")
vim.cmd("colorscheme catppuccino")
