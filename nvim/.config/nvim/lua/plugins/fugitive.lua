  -- doom-like mnemonic bindings
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map('n', '<leader>gg', ':Git<CR>', opts)
  map('n', '<leader>gB', ':Git blame<CR>', opts)
