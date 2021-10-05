local cmp = require("cmp")
local lspinstall = require("lspinstall")
local luasnip = require("luasnip")
local nvim_lsp = require("lspconfig")
local nest = require("nest")

-- lspinstall --
lspinstall.setup()

-- lspconfig --
local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	nest.applyKeymaps({
		{
			buffer = bufnr,
			{
				{
					"<leader>",
					{
						{
							"w",
							{
								{ "a", "<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>" },
								{ "r", "<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
								{ "l", "<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" },
							},
						},
						{ "ca", "<CMD>lua vim.lsp.buf.code_action()<CR>" },
						{ "D", "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
						{ "e", "<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" },
						{ "q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" },
						{ "rn", "<CMD>lua vim.lsp.buf.rename()<CR>" },
						{ "so", "<CMD>lua require('telescope.builtin').lsp_document_symbols()<CR>" },
					},
				},
				{
					"g",
					{
						{ "D", "<CMD>lua vim.lsp.buf.declaration()<CR>" },
						{ "d", "<CMD>lua vim.lsp.buf.definition()<CR>" },
						{ "i", "<CMD>lua vim.lsp.buf.implementation()<CR>" },
						{ "r", "<CMD>lua vim.lsp.buf.references()<CR>" },
					},
				},
				{ "[d", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>" },
				{ "]d", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>" },
				{ "K", "<CMD>lua vim.lsp.buf.hover()<CR>" },
			},
		},
	})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Enable the following language servers
local servers = lspinstall.installed_servers()
for _, server in pairs(servers) do
	nvim_lsp[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Some special lua setup
nvim_lsp.lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- nvim-cmp setup
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})
