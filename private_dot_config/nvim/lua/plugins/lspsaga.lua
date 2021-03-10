local saga = require 'lspsaga'
local map = vim.api.nvim_set_keymap

saga.init_lsp_saga {
  use_saga_diagnostic_sign = false
}

-- lsp provider to find the cursor word definition and reference
map('n', 'gr', ":Lspsaga lsp_finder<CR>", { noremap = true, silent = true })

-- code action
map('n', '<leader>ca', ":Lspsaga code_action<CR>", { noremap = true, silent = true })
map('v', '<leader>ca', ":<C-U>Lspsaga range_code_action<CR>", { noremap = true, silent = true })

-- show hover doc
map('n', 'K', ":Lspsaga hover_doc<CR>", { noremap = true, silent = true })

-- show signature help
map('n', 'gs', ":Lspsaga signature_help<CR>", { noremap = true, silent = true })

-- rename
map('n', '<leader>rn', ":Lspsaga rename<CR>", { noremap = true, silent = true })

-- preview definition
map('n', 'gd', ":Lspsaga preview_definition<CR>", { noremap = true, silent = true })

-- show diagnostics
map('n', '<leader>a', ":Lspsaga show_line_diagnostics<CR>", { noremap = true, silent = true })

-- next diagnostic
map('n', ']g', ":Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true })

-- previous diagnostic
map('n', '[g', ":Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true })
