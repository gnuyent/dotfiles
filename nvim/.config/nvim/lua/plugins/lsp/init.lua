local g = vim.g
local go = vim.o
local map = vim.api.nvim_set_keymap

-- lspsaga configuration
local saga = require 'lspsaga'

saga.init_lsp_saga {use_saga_diagnostic_sign = false}

local opts = {noremap = true, silent = true}
-- lsp provider to find the cursor word definition and reference
map('n', 'gr', ":Lspsaga lsp_finder<CR>", opts)

-- code action
map('n', '<leader>ca', ":Lspsaga code_action<CR>", opts)
map('v', '<leader>ca', ":<C-U>Lspsaga range_code_action<CR>", opts)

-- show hover doc
map('n', 'K', ":Lspsaga hover_doc<CR>", opts)
map('n', '<C-n>',
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map('n', '<C-m>',
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

-- show signature help
map('n', 'gs', ":Lspsaga signature_help<CR>", opts)

-- rename
map('n', '<leader>rn', ":Lspsaga rename<CR>", opts)

-- show diagnostics
map('n', '<leader>a', ":Lspsaga show_line_diagnostics<CR>", opts)

-- next diagnostic
map('n', ']g', ":Lspsaga diagnostic_jump_next<CR>", opts)

-- previous diagnostic
map('n', '[g', ":Lspsaga diagnostic_jump_prev<CR>", opts)

vim.api.nvim_exec([[
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = 'Comment', enabled = {'TypeHint', 'ChainingHint', 'ParameterHint'} }
]], false)
local on_attach = function(client, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = {noremap = true, silent = true}
    map('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        map("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
            opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
    end

end

local luaformat = {formatCommand = "lua-format -i", formatStdin = true}

local lua_settings = {
    Lua = {
        runtime = {
            -- LuaJIT in the case of Neovim
            version = 'LuaJIT',
            path = vim.split(package.path, ';')
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'}
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
            }
        }
    }
}

local function efm()
    return {
        filetypes = {"lua"},
        init_options = {documentFormatting = true},
        settings = {rootMarkers = {".git/"}, languages = {lua = {luaformat}}}
    }
end

-- config that activates keymaps and enables snippet support
local function make_config()
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            update_in_insert = false,
            -- Enable virtual text only on Warning or above, override spacing to 2
            virtual_text = {spacing = 2, severity_limit = "Warning"}
        })

    -- Pretty icons
    vim.lsp.protocol.CompletionItemKind =
        {
            '', -- Text          = 1;
            '', -- Method        = 2;
            '', -- Function      = 3;
            '汹', -- Constructor   = 4;
            '識', -- Field         = 5;
            '衮', -- Variable      = 6;
            '㕡', -- Class         = 7;
            'ﰮ', -- Interface     = 8;
            '', -- Module        = 9;
            '', -- Property      = 10;
            '撴', -- Unit          = 11;
            '', -- Value         = 12;
            '了', -- Enum          = 13;
            '', -- Keyword       = 14;(
            '﬌', -- Snippet       = 15;
            '凇', -- Color         = 16;
            '', -- File          = 17;
            '渚', -- Reference     = 18;
            '', -- Folder        = 19;
            '', -- EnumMember    = 20;
            '沜', -- Constant      = 21;
            '', -- Struct        = 22;
            '鬒', -- Event         = 23;
            'Ψ', -- Operator      = 24;
            'ひ' -- TypeParameter = 25;
        }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach
    }
end

local function setup_servers()
    local lspinstall = require 'lspinstall'
    local lspconfig = require 'lspconfig'

    lspinstall.setup()

    -- get all installed servers
    local servers = lspinstall.installed_servers()
    -- ... and add manually installed servers
    -- manually installed goes here.

    for _, server in pairs(servers) do
        local config = make_config()

        -- language specific config
        if server == "lua" then config.settings = lua_settings end
        if server == "efm" then
            config = vim.tbl_extend("force", config, efm())
        end

        lspconfig[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- triggers FileType autocmd that starts server
end
