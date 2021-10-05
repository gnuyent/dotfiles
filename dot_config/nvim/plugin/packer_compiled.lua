-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

time([[Luarocks path setup]], true)
local package_path_str = "/Users/brandon/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/brandon/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/brandon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/brandon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/brandon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Catppuccino.nvim"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/Catppuccino.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n±\1\0\0\5\0\n\1\0165\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0006\1\2\0009\1\6\0019\1\a\1'\3\b\0B\1\2\2=\1\t\0L\0\2\0\bcwd\n%:p:h\vexpand\afn\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\22--assume-filename\1\0\2\bexe\17clang-format\nstdin\2\5ÄÄ¿ô\4&\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\rstylua -\nstdin\0026\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\bexe\nblack\nstdin\2D\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\bexe\frustfmt\nstdin\2∏\1\1\0\a\0\15\0\0283\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\r\0005\4\4\0004\5\3\0>\0\1\5=\5\5\0044\5\3\0>\0\1\5=\5\6\0044\5\3\0003\6\a\0>\6\1\5=\5\b\0044\5\3\0003\6\t\0>\6\1\5=\5\n\0044\5\3\0003\6\v\0>\6\1\5=\5\f\4=\4\14\3B\1\2\1K\0\1\0\rfiletype\1\0\0\trust\0\vpython\0\blua\0\bcpp\6c\1\0\0\nsetup\14formatter\frequire\0\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n–\2\0\0\2\0\n\0\0216\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0006\0\0\0009\0\1\0+\1\1\0=\1\t\0K\0\1\0004indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\4\0\0\thelp\vpacker\fOutline&indent_blankline_filetype_exclude\vLineNr$indent_blankline_char_highlight\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude\6g\bvim\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n|\0\0\3\0\b\0\0146\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\bÄ5\1\4\0009\2\3\0=\2\3\0019\2\5\0=\2\6\0019\2\a\0=\2\a\1L\1\2\0K\0\1\0\fremoved\rmodified\fchanged\1\0\0\nadded\25gitsigns_status_dict\6b\bvim˙\5\1\0\t\0'\00096\0\0\0'\2\1\0B\0\2\0023\1\2\0009\2\3\0005\4\v\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\0054\6\3\0005\a\16\0=\1\17\a>\a\1\0065\a\18\0>\a\2\6=\6\19\0055\6\20\0=\6\21\0055\6\27\0005\a\22\0005\b\23\0=\b\24\a5\b\25\0=\b\26\a>\a\1\0065\a\28\0>\a\3\6=\6\29\0055\6\30\0=\6\31\0055\6 \0=\6!\5=\5\"\0045\5#\0004\6\0\0=\6\15\0054\6\0\0=\6\19\0055\6$\0=\6\21\0055\6%\0=\6\29\0054\6\0\0=\6\31\0054\6\0\0=\6!\5=\5&\4B\2\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\1\0\15fileformat\18icons_enabled\1\1\5\0\0\0\rencoding\0\rfiletype\fsymbols\1\0\4\nerror\6E\twarn\6W\tinfo\6I\thint\6H\fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\21update_in_insert\1\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\20b:gitsigns_head\vsource\1\2\0\0\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\2\0\0\fOutline\25component_separators\1\0\2\tleft\6|\nright\6|\23section_separators\1\0\2\tleft\5\nright\5\1\0\2\ntheme\16catppuccino\18icons_enabled\2\nsetup\0\flualine\frequire\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n8\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nest.nvim"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/nest.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15treesitter\frequire\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\nwidth\3\15\20symbols_outline\6g\bvim\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n€\2\0\0\b\0\21\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1'\3\4\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\5\0015\3\19\0005\4\a\0005\5\6\0=\5\b\0045\5\16\0005\6\n\0009\a\t\0=\a\v\0069\a\f\0=\a\r\0069\a\14\0=\a\15\6=\6\17\5=\5\18\4=\4\20\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6i\1\0\0\n<esc>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\2\n<C-d>\1\n<C-u>\1\24move_selection_next\25file_ignore_patterns\1\0\0\1\4\0\0\b*.o\rtarget/*\vvenv/*\nsetup\bfzf\19load_extension\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/brandon/.local/share/nvim/site/pack/packer/start/vim-commentary"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n–\2\0\0\2\0\n\0\0216\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0006\0\0\0009\0\1\0+\1\1\0=\1\t\0K\0\1\0004indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\4\0\0\thelp\vpacker\fOutline&indent_blankline_filetype_exclude\vLineNr$indent_blankline_char_highlight\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\nwidth\3\15\20symbols_outline\6g\bvim\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n8\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n|\0\0\3\0\b\0\0146\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\bÄ5\1\4\0009\2\3\0=\2\3\0019\2\5\0=\2\6\0019\2\a\0=\2\a\1L\1\2\0K\0\1\0\fremoved\rmodified\fchanged\1\0\0\nadded\25gitsigns_status_dict\6b\bvim˙\5\1\0\t\0'\00096\0\0\0'\2\1\0B\0\2\0023\1\2\0009\2\3\0005\4\v\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\0054\6\3\0005\a\16\0=\1\17\a>\a\1\0065\a\18\0>\a\2\6=\6\19\0055\6\20\0=\6\21\0055\6\27\0005\a\22\0005\b\23\0=\b\24\a5\b\25\0=\b\26\a>\a\1\0065\a\28\0>\a\3\6=\6\29\0055\6\30\0=\6\31\0055\6 \0=\6!\5=\5\"\0045\5#\0004\6\0\0=\6\15\0054\6\0\0=\6\19\0055\6$\0=\6\21\0055\6%\0=\6\29\0054\6\0\0=\6\31\0054\6\0\0=\6!\5=\5&\4B\2\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\1\0\15fileformat\18icons_enabled\1\1\5\0\0\0\rencoding\0\rfiletype\fsymbols\1\0\4\nerror\6E\twarn\6W\tinfo\6I\thint\6H\fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\21update_in_insert\1\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\20b:gitsigns_head\vsource\1\2\0\0\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\2\0\0\fOutline\25component_separators\1\0\2\tleft\6|\nright\6|\23section_separators\1\0\2\tleft\5\nright\5\1\0\2\ntheme\16catppuccino\18icons_enabled\2\nsetup\0\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n€\2\0\0\b\0\21\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1'\3\4\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\5\0015\3\19\0005\4\a\0005\5\6\0=\5\b\0045\5\16\0005\6\n\0009\a\t\0=\a\v\0069\a\f\0=\a\r\0069\a\14\0=\a\15\6=\6\17\5=\5\18\4=\4\20\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6i\1\0\0\n<esc>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\2\n<C-d>\1\n<C-u>\1\24move_selection_next\25file_ignore_patterns\1\0\0\1\4\0\0\b*.o\rtarget/*\vvenv/*\nsetup\bfzf\19load_extension\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n±\1\0\0\5\0\n\1\0165\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0006\1\2\0009\1\6\0019\1\a\1'\3\b\0B\1\2\2=\1\t\0L\0\2\0\bcwd\n%:p:h\vexpand\afn\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\22--assume-filename\1\0\2\bexe\17clang-format\nstdin\2\5ÄÄ¿ô\4&\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\rstylua -\nstdin\0026\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\bexe\nblack\nstdin\2D\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\18--emit=stdout\1\0\2\bexe\frustfmt\nstdin\2∏\1\1\0\a\0\15\0\0283\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\r\0005\4\4\0004\5\3\0>\0\1\5=\5\5\0044\5\3\0>\0\1\5=\5\6\0044\5\3\0003\6\a\0>\6\1\5=\5\b\0044\5\3\0003\6\t\0>\6\1\5=\5\n\0044\5\3\0003\6\v\0>\6\1\5=\5\f\4=\4\14\3B\1\2\1K\0\1\0\rfiletype\1\0\0\trust\0\vpython\0\blua\0\bcpp\6c\1\0\0\nsetup\14formatter\frequire\0\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
