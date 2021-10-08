local null_ls = require("null-ls")

null_ls.config({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.stylua,
	},
})
require("lspconfig")["null-ls"].setup({})
