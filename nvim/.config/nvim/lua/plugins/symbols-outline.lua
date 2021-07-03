    local opts = {
        -- whether to highlight the currently hovered symbol
        -- disable if your cpu usage is higher than you want it
        -- or you just hate the highlight
        -- default: true
        highlight_hovered_item = true,

        -- whether to show outline guides
        -- default: true
        show_guides = true,

        position = 'right'
    }

    require('symbols-outline').setup(opts)
    vim.api.nvim_set_keymap('n', '<leader>os', ':SymbolsOutline<CR>',
                            {noremap = true, silent = true})
    -- Autoclose if last buffer
    vim.cmd(
        "autocmd bufenter * if (winnr('$') == 1 && &filetype =~# 'Outline') | q | endif")
