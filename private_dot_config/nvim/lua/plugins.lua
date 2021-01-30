-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

execute 'packadd packer.nvim'

-- Automatically recompile on file save
execute('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use {'christoomey/vim-tmux-navigator'}

  use {
    'RyanMillerC/better-vim-tmux-resizer',
    config = function()
      vim.g.tmux_navigator_save_on_switch = 1
    end
  }

  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()',
    config = function()
      vim.g.doge_doc_standard_python = 'google'
    end
  }

  use {
    'liuchengxu/vista.vim',
    config = function()
      -- Executive used when opening vista sidebar without specifying it.
      -- See all the avaliable executives via `:echo g:vista#executives`.
      vim.g.vista_default_executive = 'coc'

      -- Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
      vim.g['vista#renderer#enable_icon'] = 1

      -- Don't navigate to vista window on open
      vim.g.vista_stay_on_open = 0

      -- Decrease delay
      vim.g.vista_update_on_text_changed_delay = 100

      -- Vista hotkey
      vim.api.nvim_set_keymap('n', '<leader>v', '<CMD>Vista!!<CR>', { noremap = true, silent = true })
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local ts_cfg = require("nvim-treesitter.configs")

      ts_cfg.setup {
        ensure_installed = "maintained",
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = {
          enable = true,
        }
      }
    end
  }

  ----------------------------------------
  -- Visuals
  ----------------------------------------
  use {'sainnhe/forest-night'}

  use {
    'hoob3rt/lualine.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons'}
    },
    config = function()
      local lualine = require("lualine")
      lualine.theme = 'forest_night'
      lualine.extensions = {'fzf'}
      lualine.status()
    end
  }

  use {'psliwka/vim-smoothie'}

  ----------------------------------------
  -- Completion
  ----------------------------------------
  use {
    'neoclide/coc.nvim',
    config = function()
      vim.g.coc_global_extensions = {
        'coc-go',
        'coc-html',
        'coc-json',
        'coc-markdownlint',
        'coc-pyright',
        'coc-rust-analyzer',
        'coc-snippets',
      }
    end
  }

  use {'rhysd/vim-clang-format'}

  ----------------------------------------
  -- Snippets
  ----------------------------------------
  use {'honza/vim-snippets'}

  ----------------------------------------
  -- FZF
  ----------------------------------------
  use {
    'junegunn/fzf.vim',
    requires = {
      {
        'junegunn/fzf',
        run = ":call fzf#install()"
      }
    },
    config = function()
      -- Key Bindings
      vim.api.nvim_set_keymap('n', '<C-p>', '<CMD>Files<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<C-g>', '<CMD>GFiles<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<C-b>', '<CMD>Buffers<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<C-f>', '<CMD>Rg<CR>', { noremap = true, silent = true })

      -- Floating window
      -- https://github.com/junegunn/fzf.vim/issues/821#issuecomment-581273191
      vim.g.fzf_layout = {
        window = {
          width = 0.9,
          height = 0.6,
          xoffset = 0.5,
          highlight = 'Comment',
          border = 'sharp'
        }
      }
    end
  }

  ----------------------------------------
  -- Markdown/Notetaking
  ----------------------------------------
  use {
    'lervag/wiki.vim',
    config = function()
      vim.g.wiki_root = '~/notes'
      -- Avoid .wiki filetypes
      vim.g.wiki_filetypes = {'md'}
      vim.g.wiki_link_extension = '.md'
      vim.g.wiki_link_target_type = 'md'
    end
  }

  use {
    'vim-pandoc/vim-pandoc',
    config = function()
      vim.g['pandoc#modules#disabled'] = {'folding'}
      -- <leader>p to generate PDF.
      vim.api.nvim_set_keymap('n', '<leader>p', '<CMD>Pandoc! pdf<CR>', { noremap = true, silent = true })
    end,
    ft = {'markdown', 'pandoc'}
  }

  use {
    'vim-pandoc/vim-pandoc-syntax',
    config = function()
      vim.g['pandoc#syntax#conceal#urls'] = 1
    end,
    ft = {'markdown', 'pandoc'}
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = function()
      -- CTRL+p to toggle markdown preview.
      -- Note: calling <Plug>MarkdownPreviewToggle doesn't seem to work...
      vim.api.nvim_set_keymap('n', '<C-p>', '<CMD>call mkdp#util#toggle_preview()<CR>', { noremap = true, silent = true })
      vim.g.mkdp_filetypes = {'markdown', 'pandoc'}
    end,
    ft = {'markdown', 'pandoc'}
  }

  use {
    'dhruvasagar/vim-table-mode',
    ft = {'markdown', 'pandoc'}
  }
end)
