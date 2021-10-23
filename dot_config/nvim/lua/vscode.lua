vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>call VSCodeNotify('editor.action.rename')<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>call VSCodeNotify('editor.action.formatDocument')<CR>", opts)
vim.api.nvim_set_keymap("n", "gcc", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>", opts)
