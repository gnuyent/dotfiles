local M = {}

function M.config()
  local g = vim.g
  local go = vim.o
  local map = vim.api.nvim_set_keymap
  -- Remove pattern not found message
  go.shortmess = go.shortmess .. "c"

  -- Set completeopt to have a better completion experience
  go.completeopt = "menuone,noselect"

  require'compe'.setup {
      enabled = true,
      autocomplete = true,
      debug = false,
      min_length = 2,
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

  map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  map("i", "<CR>", "compe#confirm('<CR>')", { expr = true, noremap = true, silent = true })
  map("i", "<C-e>", "compe#close('<C-e>')", { expr = true, noremap = true, silent = true })
end

return M
