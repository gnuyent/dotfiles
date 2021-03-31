local M = {}

function M.config()
  local g = vim.g
  local go = vim.o
  local map = vim.api.nvim_set_keymap

  ---------------------------------------------------------------------------------------------------------------
  -- lspconfig
  ---------------------------------------------------------------------------------------------------------------
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

  -- TypeScript
  lspconfig.tsserver.setup{}

  -- Python
  lspconfig.pyright.setup{}

  -- Rust
  lspconfig.rust_analyzer.setup{
    root_dir = lspconfig.util.root_pattern('Cargo.toml', 'rust-project.json'),
    capabilities = capabilities,
  }

  -- Mappings
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }
  map('n', 'gd', "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

  ----------------------------------------
  -- nvim-compe
  ----------------------------------------
  -- Remove pattern not found message
  go.shortmess = go.shortmess .. "c"

  -- Set completeopt to have a better completion experience
  go.completeopt = "menuone,noselect"

  require'compe'.setup {
      enabled = true,
      autocomplete = true,
      debug = false,
      min_length = 1,
      preselect = 'enable',
      throttle_time = 80,
      source_timeout = 200,
      incomplete_delay = 400,
      max_abbr_width = 100,
      max_kind_width = 100,
      max_menu_width = 100,

      source = {
        path = true,
        buffer = true,
        calc = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        tags = true,
        snippets_nvim = false,
        treesitter = true,
      },
  }

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
      local col = vim.fn.col('.') - 1
      if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          return true
      else
          return false
      end
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
      return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
      return t "<Plug>(vsnip-jump-prev)"
    else
      return t "<S-Tab>"
    end
  end

  ----------------------------------------
  -- lspsaga
  ----------------------------------------
  local saga = require 'lspsaga'

  saga.init_lsp_saga {
    use_saga_diagnostic_sign = false
  }

  ----------------------------------------
  -- vim-go
  ----------------------------------------
  g.go_gopls_enabled = 0
  g.go_def_mapping_enabled = 0

  ----------------------------------------
  -- nvim-autopairs
  ----------------------------------------
  local npairs = require('nvim-autopairs')
  npairs.setup()
  vim.g.completion_confirm_key = ""

  function _G.completion_confirm()
    if vim.fn.pumvisible() ~= 0  then
      if vim.fn.complete_info()["selected"] ~= -1 then
        vim.fn["compe#confirm"]()
        return npairs.esc("<c-y>")
      else
        vim.defer_fn(function()
          vim.fn["compe#confirm"]("<cr>")
        end, 20)
        return npairs.esc("<c-n>")
      end
    else
      return npairs.check_break_line_char()
    end
  end

  ----------------------------------------
  -- Mappings
  ----------------------------------------
  local opts = { noremap = true, silent = true }
  -- lsp provider to find the cursor word definition and reference
  map('n', 'gr', ":Lspsaga lsp_finder<CR>", opts)

  -- code action
  map('n', '<leader>ca', ":Lspsaga code_action<CR>", opts)
  map('v', '<leader>ca', ":<C-U>Lspsaga range_code_action<CR>", opts)

  -- show hover doc
  map('n', 'K', ":Lspsaga hover_doc<CR>", opts)

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

  map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


  map("i", "<CR>", "v:lua.completion_confirm()", { expr = true, noremap = true })
  --map("i", "<CR>", "compe#confirm()", { expr = true, noremap = true, silent = true })

  map("i", "<C-e>", "compe#close('<C-e>')", { expr = true, noremap = true, silent = true })
end

return M
