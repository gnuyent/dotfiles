local M = {}

function M.config()
  local g = vim.g
  local go = vim.o
  local map = vim.api.nvim_set_keymap
  local saga = require 'lspsaga'

  saga.init_lsp_saga {
    use_saga_diagnostic_sign = false
  }

  local opts = { noremap = true, silent = true }
  -- lsp provider to find the cursor word definition and reference
  map('n', 'gr', ":Lspsaga lsp_finder<CR>", opts)

  -- code action
  map('n', '<leader>ca', ":Lspsaga code_action<CR>", opts)
  map('v', '<leader>ca', ":<C-U>Lspsaga range_code_action<CR>", opts)

  -- show hover doc
  map('n', 'K', ":Lspsaga hover_doc<CR>", opts)

  -- show signature help
  map('n', 'gs', ":Lspsaga signature_help<CR>", opts)

  -- rename
  map('n', '<leader>rn', ":Lspsaga rename<CR>", opts)

  -- show diagnostics
  map('n', '<leader>a', ":Lspsaga show_line_diagnostics<CR>", opts)

  -- next diagnostic
  map('n', ']g', ":Lspsaga diagnostic_jump_next<CR>", opts)

  -- previous diagnostic
  map('n', '[g', ":Lspsaga diagnostic_jump_prev<CR>", opts)
end

return M
