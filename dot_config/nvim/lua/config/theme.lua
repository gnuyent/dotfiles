local ayu = require("ayu")

vim.o.termguicolors = true
vim.cmd("set background=dark")
vim.cmd("colorscheme ayu")

ayu.setup({
	mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
	overrides = {}, -- A dictionary with a group names associated with a dictionary with parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})
