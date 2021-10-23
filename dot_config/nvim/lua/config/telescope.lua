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
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>Telescope buffers<CR>", opts)
