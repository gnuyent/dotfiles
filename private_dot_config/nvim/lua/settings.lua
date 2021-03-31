local g = vim.g
local go = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.api.nvim_command

-- Enable true colors if supported by terminal.
if vim.fn.has('nvim') == 1 then
  go.termguicolors = true
end

-- Boolean values
go.autowrite = true -- Automatically write buffers when not focused

go.ignorecase = true -- case insensitive on search
go.smartcase = true -- unless there is a capital in the search

wo.number = true -- line numbers
wo.relativenumber = true -- relative line numbers

wo.wrap = false -- disable line wrapping

go.showmode = false -- Hide mode text because statusline does it already

go.mouse = "a" -- Enable mouse mode
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
-- Merge signcolumn and number column
wo.signcolumn = "number"

go.encoding = "UTF-8" -- set encoding to UTF-8
go.hidden = true -- TextEdit might fail if hidden is not set

-- Some servers have issues with backup files
go.backup = false -- disable backup
go.writebackup = false -- disable write backup

go.cmdheight = 1 -- Space for message displays

go.updatetime = 100 -- 100ms, less delays and better UX

-- Don't pass messages to |ins-completion-menu|
go.clipboard = "unnamedplus"

-- Filetype plugins
cmd("filetype plugin indent on")
