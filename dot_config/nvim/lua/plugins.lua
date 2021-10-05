local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

-- Bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

execute("packadd packer.nvim")

local packer = require("packer")

-- Automatically recompile on file save.
execute("autocmd BufWritePost plugins.lua PackerCompile")

packer.init()

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true })
	use("LionC/nest.nvim")
	use("kyazdani42/nvim-web-devicons")
	-- use("hoob3rt/lualine.nvim")
	use({
		"shadmansaleh/lualine.nvim",
		config = function()
			local lualine = require("lualine")
			local function diff_source()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end

			lualine.setup({
				options = {
					theme = "catppuccino",
					section_separators = { left = "", right = "" },
					component_separators = { left = "|", right = "|" },
					icons_enabled = true,
					disabled_filetypes = { "Outline" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{ "diff", source = diff_source },
						{
							"b:gitsigns_head",
							-- diff_color = {
							-- 	added = "#a9b665",
							-- 	modified = "#e78a4e",
							-- 	removed = "#ea6962",
							-- },
						},
					},
					lualine_c = { "filename" },
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_lsp" },
							-- diagnostics_color = {
							-- 	error = "#ea6962",
							-- 	warn = "#e78a4e",
							-- 	info = "#7daea3",
							-- 	hint = "#d8a657",
							-- },
							symbols = { error = "E", warn = "W", info = "I", hint = "H" },
							update_in_insert = false,
						},
						"encoding",
						{
							"fileformat",
							icons_enabled = false,
						},
						"filetype",
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	}) -- FIXME: Use fork while master isn't active
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
			vim.g.indent_blankline_char_highlight = "LineNr"
			vim.g.indent_blankline_filetype_exclude = { "help", "packer", "Outline" }
			vim.g.indent_blankline_show_first_indent_level = false
			vim.g.indent_blankline_show_trailing_blankline_indent = false
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		run = ":TSUpdate",
		config = function()
			require("treesitter")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").load_extension("fzf")
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "*.o", "target/*", "venv/*" },
					mappings = {
						i = {
							-- Use [j, k] for menu movement
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							-- Map <ESC> to quit in Telescope insert mode
							["<esc>"] = actions.close,
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
			})
		end,
	})
	use("tpope/vim-commentary")
	use({
		"mhartington/formatter.nvim",
		config = function()
			local clangformat = function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
				}
			end

			require("formatter").setup({
				filetype = {
					c = { clangformat },
					cpp = { clangformat },
					lua = {
						-- stylua
						function()
							return {
								exe = "stylua -",
								stdin = true,
							}
						end,
					},
					python = {
						-- black
						function()
							return {
								exe = "black",
								args = { "-" },
								stdin = true,
							}
						end,
					},
					rust = {
						-- rustfmt
						function()
							return {
								exe = "rustfmt",
								args = { "--emit=stdout" },
								stdin = true,
							}
						end,
					},
				},
			})
		end,
	})
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			local neogit = require("neogit")
			neogit.setup({})
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"kabouzeid/nvim-lspinstall",
		},
		config = function()
			require("lsp")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("ggandor/lightspeed.nvim")
	use("Pocco81/Catppuccino.nvim")
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			vim.g.symbols_outline = { width = 15 }
		end,
	})
end)
