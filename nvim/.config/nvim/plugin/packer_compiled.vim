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
  local should_profile = true
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
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29plugins.indent-blankline\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\2/\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16"] = {
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.theme\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-base16"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.compe\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\2+\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2,\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\17plugins.tree\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
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
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\28plugins.symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2¶\5\0\0\b\0$\00076\0\0\0009\0\1\0009\0\2\0006\1\3\0'\2\4\0B\1\2\2\18\2\0\0'\3\5\0'\4\6\0'\5\a\0005\6\b\0B\2\5\1\18\2\0\0'\3\5\0'\4\t\0'\5\n\0005\6\v\0B\2\5\1\18\2\0\0'\3\5\0'\4\f\0'\5\r\0005\6\14\0B\2\5\1\18\2\0\0'\3\5\0'\4\15\0'\5\16\0005\6\17\0B\2\5\1\18\2\0\0'\3\5\0'\4\18\0'\5\19\0005\6\20\0B\2\5\0016\2\3\0'\3\21\0B\2\2\0029\2\22\0025\3\"\0005\4 \0005\5\30\0005\6\24\0009\a\23\1=\a\25\0069\a\26\1=\a\27\0069\a\28\1=\a\29\6=\6\31\5=\5!\4=\4#\3B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\14telescope\1\0\2\vsilent\2\fnoremap\0029:lua require('plugins.telescope').git_branches()<CR>\15<leader>gb\1\0\2\vsilent\2\fnoremap\2<:lua require('plugins.telescope').search_dotfiles()<CR>\15<leader>fp\1\0\1\fnoremap\2\27:Telescope buffers<CR>\n<C-b>\1\0\1\fnoremap\2\29:Telescope live_grep<CR>\n<C-f>\1\0\1\fnoremap\2\30:Telescope find_files<CR>\n<C-p>\6n\22telescope.actions\frequire\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-doge"] = {
    config = { "\27LJ\2\2,\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\17plugins.doge\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.easyalign\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\0020\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\21plugins.fugitive\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-sneak"] = {
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.sneak\frequire\0" },
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-strip-trailing-whitespace"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-strip-trailing-whitespace"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/invader/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

time("Defining packer_plugins", false)
-- Config for: vim-doge
time("Config for vim-doge", true)
try_loadstring("\27LJ\2\2,\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\17plugins.doge\frequire\0", "config", "vim-doge")
time("Config for vim-doge", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\2¶\5\0\0\b\0$\00076\0\0\0009\0\1\0009\0\2\0006\1\3\0'\2\4\0B\1\2\2\18\2\0\0'\3\5\0'\4\6\0'\5\a\0005\6\b\0B\2\5\1\18\2\0\0'\3\5\0'\4\t\0'\5\n\0005\6\v\0B\2\5\1\18\2\0\0'\3\5\0'\4\f\0'\5\r\0005\6\14\0B\2\5\1\18\2\0\0'\3\5\0'\4\15\0'\5\16\0005\6\17\0B\2\5\1\18\2\0\0'\3\5\0'\4\18\0'\5\19\0005\6\20\0B\2\5\0016\2\3\0'\3\21\0B\2\2\0029\2\22\0025\3\"\0005\4 \0005\5\30\0005\6\24\0009\a\23\1=\a\25\0069\a\26\1=\a\27\0069\a\28\1=\a\29\6=\6\31\5=\5!\4=\4#\3B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\nclose\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\14telescope\1\0\2\vsilent\2\fnoremap\0029:lua require('plugins.telescope').git_branches()<CR>\15<leader>gb\1\0\2\vsilent\2\fnoremap\2<:lua require('plugins.telescope').search_dotfiles()<CR>\15<leader>fp\1\0\1\fnoremap\2\27:Telescope buffers<CR>\n<C-b>\1\0\1\fnoremap\2\29:Telescope live_grep<CR>\n<C-f>\1\0\1\fnoremap\2\30:Telescope find_files<CR>\n<C-p>\6n\22telescope.actions\frequire\20nvim_set_keymap\bapi\bvim\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.compe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: vim-easy-align
time("Config for vim-easy-align", true)
try_loadstring("\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.easyalign\frequire\0", "config", "vim-easy-align")
time("Config for vim-easy-align", false)
-- Config for: nvim-base16
time("Config for nvim-base16", true)
try_loadstring("\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.theme\frequire\0", "config", "nvim-base16")
time("Config for nvim-base16", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\2,\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\17plugins.tree\frequire\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: lualine.nvim
time("Config for lualine.nvim", true)
try_loadstring("\27LJ\2\2/\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0", "config", "lualine.nvim")
time("Config for lualine.nvim", false)
-- Config for: vim-sneak
time("Config for vim-sneak", true)
try_loadstring("\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.sneak\frequire\0", "config", "vim-sneak")
time("Config for vim-sneak", false)
-- Config for: symbols-outline.nvim
time("Config for symbols-outline.nvim", true)
try_loadstring("\27LJ\2\0027\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\28plugins.symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time("Config for symbols-outline.nvim", false)
-- Config for: nvim-autopairs
time("Config for nvim-autopairs", true)
try_loadstring("\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0", "config", "nvim-autopairs")
time("Config for nvim-autopairs", false)
-- Config for: vim-fugitive
time("Config for vim-fugitive", true)
try_loadstring("\27LJ\2\0020\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\21plugins.fugitive\frequire\0", "config", "vim-fugitive")
time("Config for vim-fugitive", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29plugins.indent-blankline\frequire\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\2+\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
if should_profile then save_profiles(1) end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
