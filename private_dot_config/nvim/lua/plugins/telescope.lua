local map = vim.api.nvim_set_keymap
local actions = require('telescope.actions')

-- Telescope Key Bindings
map('n', '<C-p>', ":Telescope find_files<CR>", { noremap = true })
map('n', '<C-f>', ":Telescope live_grep<CR>", { noremap = true })
map('n', '<C-b>', ":Telescope buffers<CR>", { noremap = true })

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        -- Use [j, k] for menu movement
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        -- Map <ESC> to quit in Telescope insert mode
        ["<esc>"] = actions.close
      },
    },
  }
}
