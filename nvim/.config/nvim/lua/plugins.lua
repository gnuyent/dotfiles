local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

-- Bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
end

execute 'packadd packer.nvim'

local packer = require('packer')

-- Enable profiling
packer.init {
    profile = {enable = true, threshold = 1} -- Minimum 1 ms
}

-- Automatically recompile on file save.
execute('autocmd BufWritePost plugins.lua PackerCompile')

return packer.startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    -- This is a fork of the original ayu-vim theme.
    -- use {'Luxed/ayu-vim', config = function() require("plugins.theme") end}
    use {'RRethy/nvim-base16', config = function() require("plugins.theme") end}

    use {'kyazdani42/nvim-web-devicons'}

    use {
        'hoob3rt/lualine.nvim',
        config = function() require("plugins.lualine") end
    }

    use {'psliwka/vim-smoothie'}

    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua',
        config = function() require("plugins.indent-blankline") end
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            {'kabouzeid/nvim-lspinstall'}, {
                'hrsh7th/nvim-compe',
                requires = 'hrsh7th/vim-vsnip',
                config = function() require("plugins.compe") end
            },
            {'glepnir/lspsaga.nvim'},
            {
                'simrat39/symbols-outline.nvim',
                config = function() require("plugins.symbols-outline") end
            },
            {
                'windwp/nvim-autopairs',
                config = function() require("plugins.autopairs") end
            }, {'rafamadriz/friendly-snippets'},
            {'nvim-lua/lsp_extensions.nvim'}
        },
        config = function()
          require("plugins.lsp")
          --require("plugins.lsp.lua")
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = require("plugins.telescope").config
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require("plugins.treesitter") end,
        run = ':TSUpdate'
    }

    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()',
        config = function() require("plugins.doge") end
    }

    use {'tpope/vim-fugitive', config = function() require("plugins.fugitive") end}

    use {'justinmk/vim-sneak', config = function() require("plugins.sneak") end}

    use {'kyazdani42/nvim-tree.lua', config = function() require("plugins.tree") end}

    use {'tpope/vim-commentary'}

    use {'rktjmp/lush.nvim', disable = true}

    use {
        'junegunn/vim-easy-align',
        config = function() require("plugins.easyalign") end
    }

    use {'axelf4/vim-strip-trailing-whitespace'}
end)
