if not vim.g.vscode then
	require("mappings")
	require("options")
	require("plugins")
else
	require("vscode")
end
