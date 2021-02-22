local lspconfig = require('lspconfig')
local protocol = require('vim.lsp.protocol')

-- Support for rust-analyzer magic completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Pretty on_attach
local on_attach = function(client)
  protocol.CompletionItemKind = {
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
    '';   -- Keyword       = 14;
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
end

-- LSP Configurations
-- Bash
lspconfig.bashls.setup{}

-- Go
lspconfig.gopls.setup{
  capabilities = capabilities
}

-- Rust
lspconfig.rust_analyzer.setup{
  root_dir = lspconfig.util.root_pattern('Cargo.toml', 'rust-project.json'),
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Enable Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
