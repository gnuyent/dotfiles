local lspconfig = require('lspconfig')

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.cmd [[noautocmd :update]]
        end
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    -- Enable virtual text only on Warning or above, override spacing to 2
    virtual_text = {
      spacing = 2,
      severity_limit = "Warning",
    },
  }
)

-- Support for rust-analyzer magic completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Pretty icons
vim.lsp.protocol.CompletionItemKind = {
  '';   -- Text          = 1;
  '';   -- Method        = 2;
  'ƒ';   -- Function      = 3;
  '';   -- Constructor   = 4;
  '識';  -- Field         = 5;
  '';   -- Variable      = 6;
  '';   -- Class         = 7;
  'ﰮ';   -- Interface     = 8;
  '';   -- Module        = 9;
  '';   -- Property      = 10;
  '';   -- Unit          = 11;
  '';   -- Value         = 12;
  '了';  -- Enum          = 13;
  '';   -- Keyword       = 14;(
  '﬌';   -- Snippet       = 15;
  '';   -- Color         = 16;
  '';   -- File          = 17;
  '渚';  -- Reference     = 18;
  '';   -- Folder        = 19;
  '';   -- EnumMember    = 20;
  '';   -- Constant      = 21;
  '';   -- Struct        = 22;
  '鬒';  -- Event         = 23;
  'Ψ';   -- Operator      = 24;
  '';   -- TypeParameter = 25;
}

-- Autoformat
local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end
end

---------------------------------------------------------------------------------------------------------------
-- LSP Configurations
---------------------------------------------------------------------------------------------------------------
-- Formatters
local prettier_eslint = require "plugins.efm.prettier_eslint"

require "lspconfig".efm.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      typescript = {prettier_eslint},
      javascript = {prettier_eslint},
      typescriptreact = {prettier_eslint},
      javascriptreact = {prettier_eslint},
    }
  }
}
-- Bash
lspconfig.bashls.setup{}

-- Go
lspconfig.gopls.setup{
  capabilities = capabilities
}

-- JavaScript
lspconfig.tsserver.setup{}

-- Python
lspconfig.pyright.setup{}

-- Rust
lspconfig.rust_analyzer.setup{
  root_dir = lspconfig.util.root_pattern('Cargo.toml', 'rust-project.json'),
  capabilities = capabilities,
}
