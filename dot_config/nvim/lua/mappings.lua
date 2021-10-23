-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<BS>", "<C-^>", opts)
-- Window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)
vim.api.nvim_set_keymap("n", "=", "<C-w>=", opts) -- Automatically resize windows
-- Word wrap bindings
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
