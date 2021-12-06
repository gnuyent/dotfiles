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
		theme = "ayu",
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
			},
		},
		lualine_c = { "filename" },
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
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
