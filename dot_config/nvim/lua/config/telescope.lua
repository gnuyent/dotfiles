local actions = require("telescope.actions")
require("telescope").load_extension("fzf")
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "*.o", "target/*", "venv/*" },
		mappings = {
			i = {
				-- Use [j, k] for menu movement
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				-- Map <ESC> to quit in Telescope insert mode
				["<esc>"] = actions.close,
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})
