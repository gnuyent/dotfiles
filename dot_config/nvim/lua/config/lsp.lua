local cmp = require("cmp")
local luasnip = require("luasnip")
local lsp_installer = require("nvim-lsp-installer")
local nvim_lsp = require("lspconfig")
local wk = require("which-key")

-- lspconfig --
local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true }
	wk.register({
		["<leader>r"] = {
			name = "rename",
			n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol", buffer = bufnr },
		},
		["<leader>so"] = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
			"Search symbols",
			buffer = bufnr,
		},
		["]d"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Go to next diagnostic", buffer = bufnr },
		["[d"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Go to next diagnostic", buffer = bufnr },
		["<leader>c"] = {
			name = "code",
			a = { "<cmd>CodeActionMenu<CR>", "View code actions", buffer = bufnr },
			l = {
				"<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
				"Add buffer diagnostics to location list",
				buffer = bufnr,
			},
		},
		g = {
			name = "goto",
			D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration", buffer = bufnr },
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition", buffer = bufnr },
		},
		["<leader>w"] = {
			name = "workspace",
			a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder", buffer = bufnr },
			l = {
				"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
				"List workspace folders",
				buffer = bufnr,
			},
			r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder", buffer = bufnr },
		},
	})
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-- on_attach with no LSP formatting (prefer null-ls)
local on_attach_disable_formatting = function(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
	return on_attach(client)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local set = function(...)
	local ret = {}
	for _, k in ipairs({ ... }) do
		ret[k] = true
	end
	return ret
end
local no_format_servers = set("clangd")

lsp_installer.on_server_ready(function(server)
	local opts = { on_attach = on_attach }

	if no_format_servers[server.name] then
		opts = { on_attach = on_attach_disable_formatting }
	end

	-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Some special lua setup
nvim_lsp.sumneko_lua.setup({
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
			luasnip.lsp_expand(args.body)
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
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
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
