" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/invader/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/invader/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/invader/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/invader/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/invader/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["ayu-vim"] = {
    config = { "\27LJ\2\np\0\0\3\0\b\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\1\3\0=\1\5\0006\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\20colorscheme ayu\bcmd\rayucolor\6g\tdark\15background\6o\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/ayu-vim"
  },
  ["better-vim-tmux-resizer"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/better-vim-tmux-resizer"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n¥\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\b\0\0\thelp\flspinfo\rmarkdown\vpandoc\vpacker\14sagahover\nvista&indent_blankline_filetype_exclude-indent_blankline_show_first_indent_level\6g\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n˙\6\0\0\v\0!\0Q6\0\0\0009\0\1\0006\1\0\0009\1\2\0016\2\0\0009\2\3\0029\2\4\0026\3\5\0'\5\6\0B\3\2\0029\4\a\0035\6\b\0B\4\2\0015\4\t\0\18\5\2\0'\a\n\0'\b\v\0'\t\f\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\r\0'\t\14\0\18\n\4\0B\5\5\1\18\5\2\0'\a\15\0'\b\r\0'\t\16\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\17\0'\t\18\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\19\0'\t\20\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\21\0'\t\22\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\23\0'\t\24\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\25\0'\t\26\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\27\0'\t\28\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\29\0'\t\30\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\31\0'\t \0\18\n\4\0B\5\5\1K\0\1\0&:Lspsaga diagnostic_jump_prev<CR>\a[g&:Lspsaga diagnostic_jump_next<CR>\a]g':Lspsaga show_line_diagnostics<CR>\14<leader>a\24:Lspsaga rename<CR>\15<leader>rn :Lspsaga signature_help<CR>\agsF<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>\n<C-m>E<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>\n<C-n>\27:Lspsaga hover_doc<CR>\6K(:<C-U>Lspsaga range_code_action<CR>\6v\29:Lspsaga code_action<CR>\15<leader>ca\28:Lspsaga lsp_finder<CR>\agr\6n\1\0\2\fnoremap\2\vsilent\2\1\0\1\29use_saga_diagnostic_sign\1\18init_lsp_saga\flspsaga\frequire\20nvim_set_keymap\bapi\6o\6g\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nä\6\0\0\b\0#\00036\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\v\0005\5\n\0=\5\f\0045\5\r\0005\6\14\0>\6\2\5=\5\15\0045\5\16\0=\5\17\0045\5\18\0005\6\19\0>\6\2\0055\6\20\0005\a\21\0=\a\22\6>\6\4\5=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\0035\4\29\0004\5\0\0=\5\f\0044\5\0\0=\5\15\0045\5\30\0=\5\17\0045\5\31\0=\5\23\0044\5\0\0=\5\25\0044\5\0\0=\5\27\4=\4 \0035\4!\0=\4\"\3B\1\2\1K\0\1\0\15extensions\1\3\0\0\rfugitive\14nvim-tree\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\fsources\1\2\0\0\rnvim_lsp\1\2\3\0\16diagnostics\15color_warn\f#f9af4f\16color_error\f#ea6c73\15color_info\f#53bdfa\1\2\1\0\15fileformat\18icons_enabled\1\1\4\0\0\rencoding\0\rfiletype\14lualine_c\1\3\0\0\rhostname\rfilename\14lualine_b\1\2\3\0\tdiff\19color_modified\f#6994BF\18color_removed\f#D96C75\16color_added\f#91B362\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\3\0\0\bÓÇ±\bÓÇ≥\23section_separators\1\3\0\0\5\5\1\0\2\18icons_enabled\2\ntheme\rayu_dark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n9\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\t<cr>\18compe#confirm\afn\bvimí\2\1\0\4\1\f\2'6\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\27Ä6\0\0\0009\0\1\0009\0\3\0B\0\1\0029\0\4\0\b\0\1\0X\0\tÄ6\0\0\0009\0\1\0009\0\5\0B\0\1\1-\0\0\0009\0\6\0'\2\a\0002\0\17ÄX\0\15Ä6\0\0\0009\0\b\0003\2\t\0)\3\20\0B\0\3\1-\0\0\0009\0\6\0'\2\n\0002\0\0ÄD\0\2\0X\0\4Ä-\0\0\0009\0\v\0002\0\0ÄD\0\1\0K\0\1\0D\0\2\0\0¿\26check_break_line_char\n<c-n>\0\rdefer_fn\n<c-y>\besc\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\0˛ˇˇˇ\31ë\1\1\0\3\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\1'\2\6\0=\2\5\0016\1\a\0003\2\t\0=\2\b\0012\0\0ÄK\0\1\0\0\23completion_confirm\a_G\5\27completion_confirm_key\6g\bvim\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim£\1\0\0\6\0\b\2\0306\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\16Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\15\0\1\0X\2\3Ä+\1\2\0L\1\2\0X\1\2Ä+\1\1\0L\1\2\0K\0\1\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0˝\1\0\0\4\2\n\1#6\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4Ä-\0\0\0'\2\3\0D\0\2\0X\0\24Ä6\0\0\0009\0\1\0009\0\4\0'\2\5\0005\3\6\0B\0\3\2\t\0\0\0X\0\4Ä-\0\0\0'\2\a\0D\0\2\0X\0\fÄ-\0\1\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0'\2\b\0D\0\2\0X\0\4Ä6\0\0\0009\0\1\0009\0\t\0D\0\1\0K\0\1\0\3¿\4¿\19compe#complete\n<Tab>!<Plug>(vsnip-expand-or-jump)\1\2\0\0\3\1\20vsnip#available\tcall\n<C-n>\15pumvisible\afn\bvim\2»\1\0\0\4\1\t\1\0266\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4Ä-\0\0\0'\2\3\0D\0\2\0X\0\15Ä6\0\0\0009\0\1\0009\0\4\0'\2\5\0005\3\6\0B\0\3\2\t\0\0\0X\0\4Ä-\0\0\0'\2\a\0D\0\2\0X\0\3Ä-\0\0\0'\2\b\0D\0\2\0K\0\1\0\3¿\f<S-Tab>\28<Plug>(vsnip-jump-prev)\1\2\0\0\3ˇˇˇˇ\15\19vsnip#jumpable\tcall\n<C-p>\15pumvisible\afn\bvim\0029\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\t<cr>\18compe#confirm\afn\bvimí\2\1\0\4\1\f\2'6\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\27Ä6\0\0\0009\0\1\0009\0\3\0B\0\1\0029\0\4\0\b\0\1\0X\0\tÄ6\0\0\0009\0\1\0009\0\5\0B\0\1\1-\0\0\0009\0\6\0'\2\a\0002\0\17ÄX\0\15Ä6\0\0\0009\0\b\0003\2\t\0)\3\20\0B\0\3\1-\0\0\0009\0\6\0'\2\n\0002\0\0ÄD\0\2\0X\0\4Ä-\0\0\0009\0\v\0002\0\0ÄD\0\1\0K\0\1\0D\0\2\0\5¿\26check_break_line_char\n<c-n>\0\rdefer_fn\n<c-y>\besc\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\0˛ˇˇˇ\31œ\a\1\0\f\0+\0O6\0\0\0009\0\1\0006\1\0\0009\1\2\0016\2\0\0009\2\3\0029\2\4\0029\3\5\1'\4\6\0&\3\4\3=\3\5\1'\3\b\0=\3\a\0016\3\t\0'\5\n\0B\3\2\0029\3\v\0035\5\f\0005\6\r\0=\6\14\5B\3\2\0013\3\15\0003\4\16\0006\5\17\0003\6\19\0=\6\18\0056\5\17\0003\6\21\0=\6\20\0056\5\t\0'\a\22\0B\5\2\0029\6\v\5B\6\1\0016\6\0\0009\6\1\6'\a\24\0=\a\23\0066\6\17\0003\a\26\0=\a\25\6\18\6\2\0'\b\27\0'\t\28\0'\n\29\0005\v\30\0B\6\5\1\18\6\2\0'\b\31\0'\t\28\0'\n\29\0005\v \0B\6\5\1\18\6\2\0'\b\27\0'\t!\0'\n\"\0005\v#\0B\6\5\1\18\6\2\0'\b\31\0'\t!\0'\n\"\0005\v$\0B\6\5\1\18\6\2\0'\b\27\0'\t%\0'\n&\0005\v'\0B\6\5\1\18\6\2\0'\b\27\0'\t(\0'\n)\0005\v*\0B\6\5\0012\0\0ÄK\0\1\0\1\0\3\fnoremap\2\vsilent\2\texpr\2\25compe#close('<C-e>')\n<C-e>\1\0\3\fnoremap\2\vsilent\2\texpr\2\26compe#confirm('<CR>')\t<CR>\1\0\1\texpr\2\1\0\1\texpr\2\27v:lua.s_tab_complete()\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2\25v:lua.tab_complete()\n<Tab>\6i\0\23completion_confirm\5\27completion_confirm_key\19nvim-autopairs\0\19s_tab_complete\0\17tab_complete\a_G\0\0\vsource\1\0\n\nspell\2\rnvim_lua\2\vbuffer\2\15treesitter\2\ttags\2\tpath\2\tcalc\2\18snippets_nvim\1\nvsnip\2\rnvim_lsp\2\1\0\v\19max_abbr_width\3d\19max_menu_width\3d\fenabled\2\17autocomplete\2\19source_timeout\3»\1\15min_length\3\1\14preselect\venable\21incomplete_delay\3ê\3\19max_kind_width\3d\18throttle_time\3P\ndebug\1\nsetup\ncompe\frequire\21menuone,noselect\16completeopt\6c\14shortmess\20nvim_set_keymap\bapi\6o\6g\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimñ\5\1\2\n\0\16\0)3\2\0\0005\3\1\0\18\4\2\0'\6\2\0'\a\3\0'\b\4\0\18\t\3\0B\4\5\0019\4\5\0009\4\6\4\15\0\4\0X\5\aÄ\18\4\2\0'\6\2\0'\a\a\0'\b\b\0\18\t\3\0B\4\5\1X\4\nÄ9\4\5\0009\4\t\4\15\0\4\0X\5\6Ä\18\4\2\0'\6\2\0'\a\a\0'\b\n\0\18\t\3\0B\4\5\0019\4\5\0009\4\v\4\15\0\4\0X\5\6Ä6\4\f\0009\4\r\0049\4\14\4'\6\15\0+\a\1\0B\4\3\0012\0\0ÄK\0\1\0È\1      augroup lsp_document_highlight\n      autocmd! * <buffer>\n      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n      augroup END\n      \14nvim_exec\bapi\bvim\23document_highlight0<cmd>lua vim.lsp.buf.range_formatting()<CR>\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\14<leader>f\24document_formatting\26resolved_capabilities*<cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\1\0\2\fnoremap\2\vsilent\2\0µ\1\0\0\5\1\f\0\0165\0\1\0005\1\0\0=\1\2\0005\1\3\0=\1\4\0005\1\6\0005\2\5\0=\2\a\0015\2\b\0004\3\3\0-\4\0\0>\4\1\3=\3\t\2=\2\n\1=\1\v\0L\0\2\0\1¿\rsettings\14languages\blua\1\0\0\16rootMarkers\1\0\0\1\2\0\0\n.git/\17init_options\1\0\1\23documentFormatting\2\14filetypes\1\0\0\1\2\0\0\blua©\4\0\0\6\1\21\0#6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\5\0039\3\6\0035\4\a\0005\5\b\0=\5\t\4B\1\3\2=\1\3\0006\0\0\0009\0\1\0009\0\n\0005\1\f\0=\1\v\0006\0\0\0009\0\1\0009\0\n\0009\0\r\0B\0\1\0029\1\14\0009\1\15\0019\1\16\1+\2\2\0=\2\17\0015\1\18\0=\0\19\1-\2\0\0=\2\20\1L\1\2\0\0¿\14on_attach\17capabilities\1\0\0\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\1\26\0\0\bÓòí\bÔÇö\a∆í\bÓàè\bÔßº\bÓûõ\bÓÉç\bÔ∞Æ\bÔ£ñ\bÓò§\bÔëµ\bÔ¢ü\bÔ¶∫\bÔ†Ö\bÔ¨å\bÓà´\bÔÖõ\bÔ©Ü\bÔÑï\bÔÖù\bÓà¨\bÔÉä\bÔ´ç\aŒ®\bÔú®\23CompletionItemKind\rprotocol\17virtual_text\1\0\2\19severity_limit\fWarning\fspacing\3\2\1\0\2\21update_in_insert\1\14underline\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvimÇ\2\0\0\15\3\f\0%6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0019\2\4\0B\2\1\0026\3\5\0\18\5\2\0B\3\2\4H\6\20Ä-\b\0\0B\b\1\2\a\a\6\0X\t\2Ä-\t\1\0=\t\a\b\a\a\b\0X\t\bÄ6\t\t\0009\t\n\t'\v\v\0\18\f\b\0-\r\2\0B\r\1\0A\t\2\2\18\b\t\0008\t\a\0019\t\3\t\18\v\b\0B\t\2\1F\6\3\3R\6ÍK\0\1\0\4¿\2¿\3¿\nforce\15tbl_extend\bvim\befm\rsettings\blua\npairs\22installed_servers\nsetup\14lspconfig\15lspinstall\frequire5\0\0\3\1\3\0\a-\0\0\0B\0\1\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\5¿\fbufdo e\bcmd\bvim¿\5\1\0\t\0!\00066\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\0013\0\4\0005\1\5\0005\2\24\0005\3\v\0005\4\6\0006\5\0\0009\5\a\0056\a\b\0009\a\t\a'\b\n\0B\5\3\2=\5\t\4=\4\f\0035\4\14\0005\5\r\0=\5\15\4=\4\16\0035\4\21\0004\5\0\b6\6\0\0009\6\17\0069\6\18\6'\b\19\0B\6\2\2+\a\2\0<\a\6\0056\6\0\0009\6\17\0069\6\18\6'\b\20\0B\6\2\2+\a\2\0<\a\6\5=\5\22\4=\4\23\3=\3\25\0023\3\26\0003\4\27\0003\5\28\0\18\6\5\0B\6\1\0016\6\29\0'\b\30\0B\6\2\0023\a \0=\a\31\0062\0\0ÄK\0\1\0\0\22post_install_hook\15lspinstall\frequire\0\0\0\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\1\0\2\18formatCommand\18lua-format -i\16formatStdin\2\0›\1  autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = 'Comment', enabled = {'TypeHint', 'ChainingHint', 'ParameterHint'} }\n  \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nâ\5\0\0\a\0\27\0+6\0\0\0009\0\1\0006\1\0\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0004\6\0\0B\1\5\1'\1\b\0=\1\a\0)\1\30\0=\1\t\0005\1\v\0=\1\n\0)\1\0\0=\1\f\0)\1\1\0=\1\r\0)\1\1\0=\1\14\0)\1\1\0=\1\15\0)\1\0\0=\1\16\0'\1\18\0=\1\17\0)\1\1\0=\1\19\0)\1\1\0=\1\20\0)\1\1\0=\1\21\0)\1\1\0=\1\22\0)\1\1\0=\1\23\0)\1\1\0=\1\24\0005\1\26\0=\1\25\0K\0\1\0\1\0\3\ffolders\3\1\bgit\3\1\nfiles\3\1\25nvim_tree_show_icons\26nvim_tree_group_empty\27nvim_tree_add_trailing\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw!nvim_tree_width_allow_resize\23nvim_tree_tab_open\a:~#nvim_tree_root_folder_modifier\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\25nvim_tree_auto_close\24nvim_tree_gitignore\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\20nvim_tree_width\tleft\19nvim_tree_side\24:NvimTreeToggle<CR>\15<leader>op\6n\20nvim_set_keymap\bapi\6g\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n±\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\2\21use_languagetree\2\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/invader/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n®\5\0\0\t\0$\00076\0\0\0009\0\1\0009\0\2\0006\1\3\0'\3\4\0B\1\2\2\18\2\0\0'\4\5\0'\5\6\0'\6\a\0005\a\b\0B\2\5\1\18\2\0\0'\4\5\0'\5\t\0'\6\n\0005\a\v\0B\2\5\1\18\2\0\0'\4\5\0'\5\f\0'\6\r\0005\a\14\0B\2\5\1\18\2\0\0'\4\5\0'\5\15\0'\6\16\0005\a\17\0B\2\5\1\18\2\0\0'\4\5\0'\5\18\0'\6\19\0005\a\20\0B\2\5\0016\2\3\0'\4\21\0B\2\2\0029\2\22\0025\4\"\0005\5 \0005\6\30\0005\a\24\0009\b\23\1=\b\25\a9\b\26\1=\b\27\a9\b\28\1=\b\29\a=\a\31\6=\6!\5=\5#\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\14telescope\1\0\1\fnoremap\2::lua require('plugins._telescope').git_branches()<CR>\15<leader>gb\1\0\1\fnoremap\2=:lua require('plugins._telescope').search_dotfiles()<CR>\15<leader>fp\1\0\1\fnoremap\2\27:Telescope buffers<CR>\n<C-b>\1\0\1\fnoremap\2\29:Telescope live_grep<CR>\n<C-f>\1\0\1\fnoremap\2\30:Telescope find_files<CR>\n<C-p>\6n\22telescope.actions\frequire\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-doge"] = {
    config = { "\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nnumpy\29doge_doc_standard_python\6g\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\ng\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0\30nmap ga <Plug>(EasyAlign)\30xmap ga <Plug>(EasyAlign)\bcmd\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nß\1\0\0\b\0\t\0\0176\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1K\0\1\0\19:Git blame<CR>\15<leader>gB\r:Git<CR>\15<leader>gg\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    config = { "\27LJ\2\nY\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\27go_def_mapping_enabled\21go_gopls_enabled\6g\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-sneak"] = {
    config = { "\27LJ\2\n€\2\0\0\a\0\17\0(6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\3\1)\2\1\0=\2\4\1\18\1\0\0'\3\5\0'\4\6\0'\5\a\0004\6\0\0B\1\5\1\18\1\0\0'\3\5\0'\4\b\0'\5\t\0004\6\0\0B\1\5\1\18\1\0\0'\3\5\0'\4\n\0'\5\v\0004\6\0\0B\1\5\1\18\1\0\0'\3\5\0'\4\f\0'\5\r\0004\6\0\0B\1\5\0016\1\0\0009\1\14\1'\3\15\0B\1\2\0016\1\0\0009\1\14\1'\3\16\0B\1\2\1K\0\1\0002autocmd User SneakLeave highlight clear Sneak\30highlight link Sneak None\bcmd\18<Plug>Sneak_T\6T\18<Plug>Sneak_t\6t\18<Plug>Sneak_F\6F\18<Plug>Sneak_f\6f\5\17sneak#s_next\6g\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-strip-trailing-whitespace"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-strip-trailing-whitespace"
  },
  ["vim-tmux-navigator"] = {
    config = { '\27LJ\2\n?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0"tmux_navigator_save_on_switch\6g\bvim\0' },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\nä\3\0\0\6\0\15\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1d\0=\1\6\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\r\0'\2\14\0B\0\2\1K\0\1\0Qautocmd bufenter * if (winnr('$') == 1 && &filetype =~# 'vista') | q | endif\bcmd\1\0\2\fnoremap\2\vsilent\2\21<CMD>Vista!!<CR>\15<leader>os\6n\20nvim_set_keymap\bapi'vista_update_on_text_changed_delay\23vista_stay_on_open\31vista#renderer#enable_icon\rnvim_lsp\28vista_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

time("Defining packer_plugins", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim£\1\0\0\6\0\b\2\0306\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\16Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\15\0\1\0X\2\3Ä+\1\2\0L\1\2\0X\1\2Ä+\1\1\0L\1\2\0K\0\1\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0˝\1\0\0\4\2\n\1#6\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4Ä-\0\0\0'\2\3\0D\0\2\0X\0\24Ä6\0\0\0009\0\1\0009\0\4\0'\2\5\0005\3\6\0B\0\3\2\t\0\0\0X\0\4Ä-\0\0\0'\2\a\0D\0\2\0X\0\fÄ-\0\1\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0'\2\b\0D\0\2\0X\0\4Ä6\0\0\0009\0\1\0009\0\t\0D\0\1\0K\0\1\0\3¿\4¿\19compe#complete\n<Tab>!<Plug>(vsnip-expand-or-jump)\1\2\0\0\3\1\20vsnip#available\tcall\n<C-n>\15pumvisible\afn\bvim\2»\1\0\0\4\1\t\1\0266\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4Ä-\0\0\0'\2\3\0D\0\2\0X\0\15Ä6\0\0\0009\0\1\0009\0\4\0'\2\5\0005\3\6\0B\0\3\2\t\0\0\0X\0\4Ä-\0\0\0'\2\a\0D\0\2\0X\0\3Ä-\0\0\0'\2\b\0D\0\2\0K\0\1\0\3¿\f<S-Tab>\28<Plug>(vsnip-jump-prev)\1\2\0\0\3ˇˇˇˇ\15\19vsnip#jumpable\tcall\n<C-p>\15pumvisible\afn\bvim\0029\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\t<cr>\18compe#confirm\afn\bvimí\2\1\0\4\1\f\2'6\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\27Ä6\0\0\0009\0\1\0009\0\3\0B\0\1\0029\0\4\0\b\0\1\0X\0\tÄ6\0\0\0009\0\1\0009\0\5\0B\0\1\1-\0\0\0009\0\6\0'\2\a\0002\0\17ÄX\0\15Ä6\0\0\0009\0\b\0003\2\t\0)\3\20\0B\0\3\1-\0\0\0009\0\6\0'\2\n\0002\0\0ÄD\0\2\0X\0\4Ä-\0\0\0009\0\v\0002\0\0ÄD\0\1\0K\0\1\0D\0\2\0\5¿\26check_break_line_char\n<c-n>\0\rdefer_fn\n<c-y>\besc\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\0˛ˇˇˇ\31œ\a\1\0\f\0+\0O6\0\0\0009\0\1\0006\1\0\0009\1\2\0016\2\0\0009\2\3\0029\2\4\0029\3\5\1'\4\6\0&\3\4\3=\3\5\1'\3\b\0=\3\a\0016\3\t\0'\5\n\0B\3\2\0029\3\v\0035\5\f\0005\6\r\0=\6\14\5B\3\2\0013\3\15\0003\4\16\0006\5\17\0003\6\19\0=\6\18\0056\5\17\0003\6\21\0=\6\20\0056\5\t\0'\a\22\0B\5\2\0029\6\v\5B\6\1\0016\6\0\0009\6\1\6'\a\24\0=\a\23\0066\6\17\0003\a\26\0=\a\25\6\18\6\2\0'\b\27\0'\t\28\0'\n\29\0005\v\30\0B\6\5\1\18\6\2\0'\b\31\0'\t\28\0'\n\29\0005\v \0B\6\5\1\18\6\2\0'\b\27\0'\t!\0'\n\"\0005\v#\0B\6\5\1\18\6\2\0'\b\31\0'\t!\0'\n\"\0005\v$\0B\6\5\1\18\6\2\0'\b\27\0'\t%\0'\n&\0005\v'\0B\6\5\1\18\6\2\0'\b\27\0'\t(\0'\n)\0005\v*\0B\6\5\0012\0\0ÄK\0\1\0\1\0\3\fnoremap\2\vsilent\2\texpr\2\25compe#close('<C-e>')\n<C-e>\1\0\3\fnoremap\2\vsilent\2\texpr\2\26compe#confirm('<CR>')\t<CR>\1\0\1\texpr\2\1\0\1\texpr\2\27v:lua.s_tab_complete()\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2\25v:lua.tab_complete()\n<Tab>\6i\0\23completion_confirm\5\27completion_confirm_key\19nvim-autopairs\0\19s_tab_complete\0\17tab_complete\a_G\0\0\vsource\1\0\n\nspell\2\rnvim_lua\2\vbuffer\2\15treesitter\2\ttags\2\tpath\2\tcalc\2\18snippets_nvim\1\nvsnip\2\rnvim_lsp\2\1\0\v\19max_abbr_width\3d\19max_menu_width\3d\fenabled\2\17autocomplete\2\19source_timeout\3»\1\15min_length\3\1\14preselect\venable\21incomplete_delay\3ê\3\19max_kind_width\3d\18throttle_time\3P\ndebug\1\nsetup\ncompe\frequire\21menuone,noselect\16completeopt\6c\14shortmess\20nvim_set_keymap\bapi\6o\6g\bvim\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: vim-go
time("Config for vim-go", true)
try_loadstring("\27LJ\2\nY\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\27go_def_mapping_enabled\21go_gopls_enabled\6g\bvim\0", "config", "vim-go")
time("Config for vim-go", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimñ\5\1\2\n\0\16\0)3\2\0\0005\3\1\0\18\4\2\0'\6\2\0'\a\3\0'\b\4\0\18\t\3\0B\4\5\0019\4\5\0009\4\6\4\15\0\4\0X\5\aÄ\18\4\2\0'\6\2\0'\a\a\0'\b\b\0\18\t\3\0B\4\5\1X\4\nÄ9\4\5\0009\4\t\4\15\0\4\0X\5\6Ä\18\4\2\0'\6\2\0'\a\a\0'\b\n\0\18\t\3\0B\4\5\0019\4\5\0009\4\v\4\15\0\4\0X\5\6Ä6\4\f\0009\4\r\0049\4\14\4'\6\15\0+\a\1\0B\4\3\0012\0\0ÄK\0\1\0È\1      augroup lsp_document_highlight\n      autocmd! * <buffer>\n      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n      augroup END\n      \14nvim_exec\bapi\bvim\23document_highlight0<cmd>lua vim.lsp.buf.range_formatting()<CR>\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\14<leader>f\24document_formatting\26resolved_capabilities*<cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\1\0\2\fnoremap\2\vsilent\2\0µ\1\0\0\5\1\f\0\0165\0\1\0005\1\0\0=\1\2\0005\1\3\0=\1\4\0005\1\6\0005\2\5\0=\2\a\0015\2\b\0004\3\3\0-\4\0\0>\4\1\3=\3\t\2=\2\n\1=\1\v\0L\0\2\0\1¿\rsettings\14languages\blua\1\0\0\16rootMarkers\1\0\0\1\2\0\0\n.git/\17init_options\1\0\1\23documentFormatting\2\14filetypes\1\0\0\1\2\0\0\blua©\4\0\0\6\1\21\0#6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\5\0039\3\6\0035\4\a\0005\5\b\0=\5\t\4B\1\3\2=\1\3\0006\0\0\0009\0\1\0009\0\n\0005\1\f\0=\1\v\0006\0\0\0009\0\1\0009\0\n\0009\0\r\0B\0\1\0029\1\14\0009\1\15\0019\1\16\1+\2\2\0=\2\17\0015\1\18\0=\0\19\1-\2\0\0=\2\20\1L\1\2\0\0¿\14on_attach\17capabilities\1\0\0\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\1\26\0\0\bÓòí\bÔÇö\a∆í\bÓàè\bÔßº\bÓûõ\bÓÉç\bÔ∞Æ\bÔ£ñ\bÓò§\bÔëµ\bÔ¢ü\bÔ¶∫\bÔ†Ö\bÔ¨å\bÓà´\bÔÖõ\bÔ©Ü\bÔÑï\bÔÖù\bÓà¨\bÔÉä\bÔ´ç\aŒ®\bÔú®\23CompletionItemKind\rprotocol\17virtual_text\1\0\2\19severity_limit\fWarning\fspacing\3\2\1\0\2\21update_in_insert\1\14underline\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvimÇ\2\0\0\15\3\f\0%6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0019\2\4\0B\2\1\0026\3\5\0\18\5\2\0B\3\2\4H\6\20Ä-\b\0\0B\b\1\2\a\a\6\0X\t\2Ä-\t\1\0=\t\a\b\a\a\b\0X\t\bÄ6\t\t\0009\t\n\t'\v\v\0\18\f\b\0-\r\2\0B\r\1\0A\t\2\2\18\b\t\0008\t\a\0019\t\3\t\18\v\b\0B\t\2\1F\6\3\3R\6ÍK\0\1\0\4¿\2¿\3¿\nforce\15tbl_extend\bvim\befm\rsettings\blua\npairs\22installed_servers\nsetup\14lspconfig\15lspinstall\frequire5\0\0\3\1\3\0\a-\0\0\0B\0\1\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\5¿\fbufdo e\bcmd\bvim¿\5\1\0\t\0!\00066\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\0013\0\4\0005\1\5\0005\2\24\0005\3\v\0005\4\6\0006\5\0\0009\5\a\0056\a\b\0009\a\t\a'\b\n\0B\5\3\2=\5\t\4=\4\f\0035\4\14\0005\5\r\0=\5\15\4=\4\16\0035\4\21\0004\5\0\b6\6\0\0009\6\17\0069\6\18\6'\b\19\0B\6\2\2+\a\2\0<\a\6\0056\6\0\0009\6\17\0069\6\18\6'\b\20\0B\6\2\2+\a\2\0<\a\6\5=\5\22\4=\4\23\3=\3\25\0023\3\26\0003\4\27\0003\5\28\0\18\6\5\0B\6\1\0016\6\29\0'\b\30\0B\6\2\0023\a \0=\a\31\0062\0\0ÄK\0\1\0\0\22post_install_hook\15lspinstall\frequire\0\0\0\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\1\0\2\18formatCommand\18lua-format -i\16formatStdin\2\0›\1  autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = 'Comment', enabled = {'TypeHint', 'ChainingHint', 'ParameterHint'} }\n  \14nvim_exec\bapi\bvim\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: vim-sneak
time("Config for vim-sneak", true)
try_loadstring("\27LJ\2\n€\2\0\0\a\0\17\0(6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\3\1)\2\1\0=\2\4\1\18\1\0\0'\3\5\0'\4\6\0'\5\a\0004\6\0\0B\1\5\1\18\1\0\0'\3\5\0'\4\b\0'\5\t\0004\6\0\0B\1\5\1\18\1\0\0'\3\5\0'\4\n\0'\5\v\0004\6\0\0B\1\5\1\18\1\0\0'\3\5\0'\4\f\0'\5\r\0004\6\0\0B\1\5\0016\1\0\0009\1\14\1'\3\15\0B\1\2\0016\1\0\0009\1\14\1'\3\16\0B\1\2\1K\0\1\0002autocmd User SneakLeave highlight clear Sneak\30highlight link Sneak None\bcmd\18<Plug>Sneak_T\6T\18<Plug>Sneak_t\6t\18<Plug>Sneak_F\6F\18<Plug>Sneak_f\6f\5\17sneak#s_next\6g\20nvim_set_keymap\bapi\bvim\0", "config", "vim-sneak")
time("Config for vim-sneak", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\nâ\5\0\0\a\0\27\0+6\0\0\0009\0\1\0006\1\0\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0004\6\0\0B\1\5\1'\1\b\0=\1\a\0)\1\30\0=\1\t\0005\1\v\0=\1\n\0)\1\0\0=\1\f\0)\1\1\0=\1\r\0)\1\1\0=\1\14\0)\1\1\0=\1\15\0)\1\0\0=\1\16\0'\1\18\0=\1\17\0)\1\1\0=\1\19\0)\1\1\0=\1\20\0)\1\1\0=\1\21\0)\1\1\0=\1\22\0)\1\1\0=\1\23\0)\1\1\0=\1\24\0005\1\26\0=\1\25\0K\0\1\0\1\0\3\ffolders\3\1\bgit\3\1\nfiles\3\1\25nvim_tree_show_icons\26nvim_tree_group_empty\27nvim_tree_add_trailing\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw!nvim_tree_width_allow_resize\23nvim_tree_tab_open\a:~#nvim_tree_root_folder_modifier\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\25nvim_tree_auto_close\24nvim_tree_gitignore\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\20nvim_tree_width\tleft\19nvim_tree_side\24:NvimTreeToggle<CR>\15<leader>op\6n\20nvim_set_keymap\bapi\6g\bvim\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: ayu-vim
time("Config for ayu-vim", true)
try_loadstring("\27LJ\2\np\0\0\3\0\b\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\1\3\0=\1\5\0006\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\20colorscheme ayu\bcmd\rayucolor\6g\tdark\15background\6o\bvim\0", "config", "ayu-vim")
time("Config for ayu-vim", false)
-- Config for: vista.vim
time("Config for vista.vim", true)
try_loadstring("\27LJ\2\nä\3\0\0\6\0\15\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1d\0=\1\6\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\r\0'\2\14\0B\0\2\1K\0\1\0Qautocmd bufenter * if (winnr('$') == 1 && &filetype =~# 'vista') | q | endif\bcmd\1\0\2\fnoremap\2\vsilent\2\21<CMD>Vista!!<CR>\15<leader>os\6n\20nvim_set_keymap\bapi'vista_update_on_text_changed_delay\23vista_stay_on_open\31vista#renderer#enable_icon\rnvim_lsp\28vista_default_executive\6g\bvim\0", "config", "vista.vim")
time("Config for vista.vim", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\n¥\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\b\0\0\thelp\flspinfo\rmarkdown\vpandoc\vpacker\14sagahover\nvista&indent_blankline_filetype_exclude-indent_blankline_show_first_indent_level\6g\bvim\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n®\5\0\0\t\0$\00076\0\0\0009\0\1\0009\0\2\0006\1\3\0'\3\4\0B\1\2\2\18\2\0\0'\4\5\0'\5\6\0'\6\a\0005\a\b\0B\2\5\1\18\2\0\0'\4\5\0'\5\t\0'\6\n\0005\a\v\0B\2\5\1\18\2\0\0'\4\5\0'\5\f\0'\6\r\0005\a\14\0B\2\5\1\18\2\0\0'\4\5\0'\5\15\0'\6\16\0005\a\17\0B\2\5\1\18\2\0\0'\4\5\0'\5\18\0'\6\19\0005\a\20\0B\2\5\0016\2\3\0'\4\21\0B\2\2\0029\2\22\0025\4\"\0005\5 \0005\6\30\0005\a\24\0009\b\23\1=\b\25\a9\b\26\1=\b\27\a9\b\28\1=\b\29\a=\a\31\6=\6!\5=\5#\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\14telescope\1\0\1\fnoremap\2::lua require('plugins._telescope').git_branches()<CR>\15<leader>gb\1\0\1\fnoremap\2=:lua require('plugins._telescope').search_dotfiles()<CR>\15<leader>fp\1\0\1\fnoremap\2\27:Telescope buffers<CR>\n<C-b>\1\0\1\fnoremap\2\29:Telescope live_grep<CR>\n<C-f>\1\0\1\fnoremap\2\30:Telescope find_files<CR>\n<C-p>\6n\22telescope.actions\frequire\20nvim_set_keymap\bapi\bvim\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: vim-doge
time("Config for vim-doge", true)
try_loadstring("\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nnumpy\29doge_doc_standard_python\6g\bvim\0", "config", "vim-doge")
time("Config for vim-doge", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n±\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\2\21use_languagetree\2\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: lualine.nvim
time("Config for lualine.nvim", true)
try_loadstring("\27LJ\2\nä\6\0\0\b\0#\00036\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\v\0005\5\n\0=\5\f\0045\5\r\0005\6\14\0>\6\2\5=\5\15\0045\5\16\0=\5\17\0045\5\18\0005\6\19\0>\6\2\0055\6\20\0005\a\21\0=\a\22\6>\6\4\5=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\0035\4\29\0004\5\0\0=\5\f\0044\5\0\0=\5\15\0045\5\30\0=\5\17\0045\5\31\0=\5\23\0044\5\0\0=\5\25\0044\5\0\0=\5\27\4=\4 \0035\4!\0=\4\"\3B\1\2\1K\0\1\0\15extensions\1\3\0\0\rfugitive\14nvim-tree\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\fsources\1\2\0\0\rnvim_lsp\1\2\3\0\16diagnostics\15color_warn\f#f9af4f\16color_error\f#ea6c73\15color_info\f#53bdfa\1\2\1\0\15fileformat\18icons_enabled\1\1\4\0\0\rencoding\0\rfiletype\14lualine_c\1\3\0\0\rhostname\rfilename\14lualine_b\1\2\3\0\tdiff\19color_modified\f#6994BF\18color_removed\f#D96C75\16color_added\f#91B362\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\3\0\0\bÓÇ±\bÓÇ≥\23section_separators\1\3\0\0\5\5\1\0\2\18icons_enabled\2\ntheme\rayu_dark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time("Config for lualine.nvim", false)
-- Config for: vim-easy-align
time("Config for vim-easy-align", true)
try_loadstring("\27LJ\2\ng\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0\30nmap ga <Plug>(EasyAlign)\30xmap ga <Plug>(EasyAlign)\bcmd\bvim\0", "config", "vim-easy-align")
time("Config for vim-easy-align", false)
-- Config for: lspsaga.nvim
time("Config for lspsaga.nvim", true)
try_loadstring("\27LJ\2\n˙\6\0\0\v\0!\0Q6\0\0\0009\0\1\0006\1\0\0009\1\2\0016\2\0\0009\2\3\0029\2\4\0026\3\5\0'\5\6\0B\3\2\0029\4\a\0035\6\b\0B\4\2\0015\4\t\0\18\5\2\0'\a\n\0'\b\v\0'\t\f\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\r\0'\t\14\0\18\n\4\0B\5\5\1\18\5\2\0'\a\15\0'\b\r\0'\t\16\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\17\0'\t\18\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\19\0'\t\20\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\21\0'\t\22\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\23\0'\t\24\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\25\0'\t\26\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\27\0'\t\28\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\29\0'\t\30\0\18\n\4\0B\5\5\1\18\5\2\0'\a\n\0'\b\31\0'\t \0\18\n\4\0B\5\5\1K\0\1\0&:Lspsaga diagnostic_jump_prev<CR>\a[g&:Lspsaga diagnostic_jump_next<CR>\a]g':Lspsaga show_line_diagnostics<CR>\14<leader>a\24:Lspsaga rename<CR>\15<leader>rn :Lspsaga signature_help<CR>\agsF<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>\n<C-m>E<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>\n<C-n>\27:Lspsaga hover_doc<CR>\6K(:<C-U>Lspsaga range_code_action<CR>\6v\29:Lspsaga code_action<CR>\15<leader>ca\28:Lspsaga lsp_finder<CR>\agr\6n\1\0\2\fnoremap\2\vsilent\2\1\0\1\29use_saga_diagnostic_sign\1\18init_lsp_saga\flspsaga\frequire\20nvim_set_keymap\bapi\6o\6g\bvim\0", "config", "lspsaga.nvim")
time("Config for lspsaga.nvim", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\t<cr>\18compe#confirm\afn\bvimí\2\1\0\4\1\f\2'6\0\0\0009\0\1\0009\0\2\0B\0\1\2\b\0\0\0X\0\27Ä6\0\0\0009\0\1\0009\0\3\0B\0\1\0029\0\4\0\b\0\1\0X\0\tÄ6\0\0\0009\0\1\0009\0\5\0B\0\1\1-\0\0\0009\0\6\0'\2\a\0002\0\17ÄX\0\15Ä6\0\0\0009\0\b\0003\2\t\0)\3\20\0B\0\3\1-\0\0\0009\0\6\0'\2\n\0002\0\0ÄD\0\2\0X\0\4Ä-\0\0\0009\0\v\0002\0\0ÄD\0\1\0K\0\1\0D\0\2\0\0¿\26check_break_line_char\n<c-n>\0\rdefer_fn\n<c-y>\besc\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\0˛ˇˇˇ\31ë\1\1\0\3\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\1'\2\6\0=\2\5\0016\1\a\0003\2\t\0=\2\b\0012\0\0ÄK\0\1\0\0\23completion_confirm\a_G\5\27completion_confirm_key\6g\bvim\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)
-- Config for: vim-fugitive
time("Config for vim-fugitive", true)
try_loadstring("\27LJ\2\nß\1\0\0\b\0\t\0\0176\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1K\0\1\0\19:Git blame<CR>\15<leader>gB\r:Git<CR>\15<leader>gg\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0", "config", "vim-fugitive")
time("Config for vim-fugitive", false)
-- Config for: vim-tmux-navigator
time("Config for vim-tmux-navigator", true)
try_loadstring('\27LJ\2\n?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0"tmux_navigator_save_on_switch\6g\bvim\0', "config", "vim-tmux-navigator")
time("Config for vim-tmux-navigator", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
