  local g = vim.g

  vim.api.nvim_set_keymap('n', '<leader>op', ':NvimTreeToggle<CR>', {})

  g.nvim_tree_side = 'left'
  g.nvim_tree_width = 30
  g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
  g.nvim_tree_gitignore = 0 -- FIXME: Disabled due to startup time
  g.nvim_tree_auto_close = 1
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_hide_dotfiles = 1
  g.nvim_tree_git_hl = 0
  g.nvim_tree_root_folder_modifier = ':~'
  g.nvim_tree_tab_open = 0
  g.nvim_tree_width_allow_resize = 1
  g.nvim_tree_disable_netrw = 1
  g.nvim_tree_hijack_netrw = 1
  g.nvim_tree_add_trailing = 1
  g.nvim_tree_group_empty = 1
  g.nvim_tree_show_icons = {
      git = 1,
      folders = 1,
      files = 1,
  }
