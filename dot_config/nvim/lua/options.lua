local go = vim.o
local wo = vim.wo
local cmd = vim.api.nvim_command

go.autowrite = true -- Automatically write buffers when not focused

go.ignorecase = true -- case insensitive on search
go.smartcase = true -- unless there is a capital in the search

wo.number = true -- line numbers
wo.relativenumber = true -- relative line numbers

wo.wrap = true -- enable line wrapping

go.showmode = false -- Hide mode text because statusline does it already

go.mouse = "a" -- Enable mouse mode

go.encoding = "UTF-8" -- set encoding to UTF-8
go.hidden = true -- TextEdit might fail if hidden is not set

go.updatetime = 100 -- 100ms, less delays and better UX

go.splitright = true -- vertical split to the right
go.splitbelow = true -- horizontal split to the bottom

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- Filetype plugins
cmd("filetype plugin indent on")

-- Automatically run `chezmoi apply` on dotfile save
cmd("autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %")

function _G.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end
