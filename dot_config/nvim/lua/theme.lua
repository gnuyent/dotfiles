local catppuccino = require("catppuccino")
catppuccino.setup({
	integrations = { lightspeed = true, gitsigns = true, neogit = true },
})
vim.o.termguicolors = true
vim.cmd("set background=dark")
vim.g.gruvbox_material_disable_italic_comment = 1
vim.cmd("colorscheme catppuccino")
