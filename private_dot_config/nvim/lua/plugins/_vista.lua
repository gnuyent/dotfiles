local M = {}

function M.config()
  -- Executive used when opening vista sidebar without specifying it.
  -- See all the avaliable executives via `:echo g:vista#executives`.
  vim.g.vista_default_executive = 'nvim_lsp'

  -- Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
  vim.g['vista#renderer#enable_icon'] = 1

  -- Don't navigate to vista window on open
  vim.g.vista_stay_on_open = 0

  -- Decrease delay
  vim.g.vista_update_on_text_changed_delay = 100

  -- Vista hotkey
  vim.api.nvim_set_keymap('n', '<leader>os', '<CMD>Vista!!<CR>', { noremap = true, silent = true })
end

return M
