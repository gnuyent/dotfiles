local wk = require("which-key")
wk.setup()
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
