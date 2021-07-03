local M = {}

function M.search_dotfiles()
  require("telescope.builtin").find_files({
    prompt_title = "Neovim Configuration Files",
    cwd = "$HOME/.config/nvim/",
  })
end

function M.git_branches()
  local actions = require('telescope.actions')
  require("telescope.builtin").git_branches({
    attach_mappings = function(_, map)
      map('i', '<c-d>', actions.git_delete_branch)
      map('n', '<c-d>', actions.git_delete_branch)
      return true
    end
  })
end

function M.config()
  local map = vim.api.nvim_set_keymap
  local actions = require('telescope.actions')

  -- Telescope Key Bindings
  map('n', '<C-p>', ":Telescope find_files<CR>", { noremap = true })
  map('n', '<C-f>', ":Telescope live_grep<CR>", { noremap = true })
  map('n', '<C-b>', ":Telescope buffers<CR>", { noremap = true })
  map('n', '<leader>fp', ":lua require('plugins.telescope').search_dotfiles()<CR>", { noremap = true, silent = true })
  map('n', '<leader>gb', ":lua require('plugins.telescope').git_branches()<CR>", { noremap = true, silent = true })

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
end

return M
