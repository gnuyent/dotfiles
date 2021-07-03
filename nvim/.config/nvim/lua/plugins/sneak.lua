  local map = vim.api.nvim_set_keymap
  -- Use 'f' and friends to move
  vim.g["sneak#s_next"] = 1
  map('', 'f', '<Plug>Sneak_f', {})
  map('', 'F', '<Plug>Sneak_F', {})
  map('', 't', '<Plug>Sneak_t', {})
  map('', 'T', '<Plug>Sneak_T', {})
  -- Disable purple highlighting
  vim.cmd("highlight link Sneak None")
  vim.cmd("autocmd User SneakLeave highlight clear Sneak")
