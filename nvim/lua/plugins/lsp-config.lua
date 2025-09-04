return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				-- "typescript-language-server",
				"tailwindcss-language-server",
				"tsserver",
				"lua-language-server",
				"html",
				-- "pyright",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local lspconfig = require("lspconfig")
			local base = require("lspconfig.configs")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities()
			)
			local on_attach = base.on_attach

			lspconfig.tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
			})

			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						-- workspace = {
						-- 	library = vim.api.nvim_get_runtime_file("", true),
						-- },
					},
				},
			})

			-- lspconfig.pyright.setup({
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- })

			-- Set up diagnostic configuration
			vim.diagnostic.config({
				-- virtual_lines = true,
				virtual_text = true, -- Show diagnostics inline
				signs = true, -- Show signs in the gutter
			})

			-- Set up keymaps for LSP
			vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostics" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
			vim.keymap.set("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Set diagnostics to location list" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.document_symbol, { desc = "Code action" })

			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			-- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
		end,
	},
}
