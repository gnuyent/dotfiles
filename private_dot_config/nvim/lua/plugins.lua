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

  ----------------------------------------
  -- tmux + nvim
  ----------------------------------------
  use {'christoomey/vim-tmux-navigator'}

  use {
    'RyanMillerC/better-vim-tmux-resizer',
    config = function()
      vim.g.tmux_navigator_save_on_switch = 1
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local ts = require("nvim-treesitter.configs")

      ts.setup {
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
  use {'sainnhe/gruvbox-material'}

  use {
    --'hoob3rt/lualine.nvim',
    '~/Projects/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      local lualine = require('lualine')
      lualine.theme = 'gruvbox_material'
      lualine.status()
    end
  }

  use {'psliwka/vim-smoothie'}

  ----------------------------------------
  -- Completion
  ----------------------------------------
  use {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require'lspconfig'
      -- LSP Configurations
      -- Go
      lspconfig.gopls.setup{}

      -- Rust
      lspconfig.rust_analyzer.setup{
        root_dir = lspconfig.util.root_pattern('Cargo.toml', 'rust-project.json'),
        on_attach = require'completion'.on_attach
      }
    end
  }

  use {
    'nvim-lua/completion-nvim',
    requires = {
      {
        'SirVer/ultisnips',
        config = function()
          vim.g.UltiSnipsExpandTrigger = '<Plug>(placeholder)'
          vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
          vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
        end
      },
      {'honza/vim-snippets'}
    },
    config = function()
      -- Use <Tab> and <S-Tab> to navigate through popup menu
      vim.cmd('inoremap <expr> <Tab>   pumvisible() ? "\\<C-n>" : "\\<Tab>"')
      vim.cmd('inoremap <expr> <S-Tab> pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')

      -- Set completeopt to have a better completion experience
      vim.cmd('set completeopt=menuone,noinsert,noselect')

      -- Avoid showing message extra message when using completion
      vim.cmd('set shortmess+=c')

      vim.g.completion_enable_snippet = 'UltiSnips'
    end
  }

  use {
    'glepnir/lspsaga.nvim',
    config = function()
      local saga = require 'lspsaga'
      local map = vim.api.nvim_set_keymap

      saga.init_lsp_saga()

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
    end
  }

  ----------------------------------------
  -- Utilities
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

  use {
    'liuchengxu/vista.vim',
    config = function()
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
      vim.api.nvim_set_keymap('n', '<leader>v', '<CMD>Vista!!<CR>', { noremap = true, silent = true })
    end
  }

  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()',
    config = function()
      vim.g.doge_doc_standard_python = 'google'
    end
  }

  use {'tpope/vim-fugitive'}

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
end)
