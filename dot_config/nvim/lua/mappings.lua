-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
if vim.g.vscode then
	vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>call VSCodeNotify('editor.action.rename')<CR>", opts)
	vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>call VSCodeNotify('editor.action.formatDocument')<CR>", opts)
	vim.api.nvim_set_keymap("n", "gcc", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>", opts)
else
	local wk = require("which-key")
	vim.api.nvim_set_keymap("n", "<BS>", "<C-^>", opts)
	-- Telescope
	vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
	vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope live_grep<CR>", opts)
	vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>Telescope buffers<CR>", opts)
	-- Window navigation
	vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
	vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
	vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
	vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)
	-- Word wrap bindings
	vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
	vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

	wk.register({
		["<leader>"] = {
			f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format buffer" },
			g = {
				name = "git",
				R = { "<cmd>lua require('gitsigns').reset_buffer()<CR>", "Reset buffer" },
				S = { "<cmd>lua require('gitsigns').stage_buffer()<CR>", "Stage buffer" },
				U = { "<cmd>lua require('gitsigns').reset_buffer_index()<CR>", "Reset buffer index" },
				b = { "<cmd>lua require('gitsigns').blame_line(true)<CR>", "Blame line" },
				c = { "<cmd>Neogit commit<CR>", "Neogit commit info" },
				g = { "<cmd>Neogit<CR>", "Neogit status" },
				p = { "<cmd>lua require('gitsigns').preview_hunk()<CR>", "Preview hunk" },
				r = { "<cmd>lua require('gitsigns').reset_hunk()<CR>", "Reset hunk" },
				s = { "<cmd>lua require('gitsigns').stage_hunk()<CR>", "Stage hunk" },
				u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", "Undo stage hunk" },
			},
			o = {
				name = "open",
				s = { "<cmd>SymbolsOutline<CR>", "Symbol Outline" },
				p = { "<cmd>NnnPicker<CR>", "nnn" },
			},
			s = {
				name = "search",
				b = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Search buffer" },
				B = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "List open buffers" },
				f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Search files in current directory" },
				h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Search vim help" },
				s = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Search in current directory" },
			},
			q = {
				name = "quit",
				a = { "<cmd>qa<CR>", "Quit all" },
				A = { "<cmd>qa!<CR>", "Quit all without saving" },
				w = { "<cmd>wq<CR>", "Write and quit" },
				q = { "<cmd>q<CR>", "Quit Neovim" },
				["!"] = { "<cmd>q!<CR>", "Quit without saving" },
			},
		},
	})
end
