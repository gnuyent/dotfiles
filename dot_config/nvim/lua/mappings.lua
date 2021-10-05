-- Plugin imports
local nest = require("nest")

-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "
if vim.g.vscode then
	nest.applyKeymaps({
		{
			"<leader>",
			{
				{ "ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<CR>" },
				{ "rn", "<cmd>call VSCodeNotify('editor.action.rename')<CR>" },
				{ "f", "<cmd>call VSCodeNotify('editor.action.formatDocument')<CR>" },
			},
		},
		{ "g", {
			{ "cc", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>" },
		} },
	})
else
	nest.applyKeymaps({
		{ "<BS>", "<C-^>" },
		{
			"<C-",
			{
				-- Telescope
				{ "p>", ":Telescope find_files<CR>" },
				{ "f>", ":Telescope live_grep<CR>" },
				{ "b>", ":Telescope buffers<CR>" },
				-- Window navigation
				{ "-h>", "<C-w>h" },
				{ "-j>", "<C-w>j" },
				{ "-k>", "<C-w>k" },
				{ "-l>", "<C-w>l" },
			},
		},
		{
			"<leader>",
			{
				-- formatter
				{ "f", ":Format<CR>" },
				-- neogit
				{ "g", {
					{ "g", ":Neogit<CR>" },
					{ "c", ":Neogit commit<CR>" },
				} },
				{
					"o",
					{
						{ "s", ":SymbolsOutline<CR>" },
					},
				},
			},
		},
	})
end
