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
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local lspconfig = require("lspconfig")
			-- local base = require("configs.lspconfig")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities()
			)
			-- local on_attach = base.on_attach

			lspconfig.tsserver.setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
			})

			lspconfig.tailwindcss.setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
		end,
	},
}
