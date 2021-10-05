local go = vim.o
local wo = vim.wo
local cmd = vim.api.nvim_command

go.autowrite = true -- Automatically write buffers when not focused

go.ignorecase = true -- case insensitive on search
go.smartcase = true -- unless there is a capital in the search

wo.number = true -- line numbers
wo.relativenumber = true -- relative line numbers

wo.wrap = false -- disable line wrapping

go.showmode = false -- Hide mode text because statusline does it already

go.mouse = "a" -- Enable mouse mode

go.encoding = "UTF-8" -- set encoding to UTF-8
go.hidden = true -- TextEdit might fail if hidden is not set

go.updatetime = 100 -- 100ms, less delays and better UX

go.splitright = true -- vertical split to the right
go.splitbelow = true -- horizontal split to the bottom

-- Filetype plugins
cmd("filetype plugin indent on")

-- Automatically run `chezmoi apply` on dotfile save
cmd("autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %")
