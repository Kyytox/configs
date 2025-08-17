return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		local harpoon = require("harpoon")

		-- disable missing-fields warning using lua annotations
		---@diagnostic disable-next-line: missing-fields

		wk.setup({
			preset = "modern",
			-- sort = { "local" },
			-- sort = { "group" },
			-- sort = { "alphanum" },
			-- sort = { "order" },
			sort = { "mod" },
			icons = {
				-- rules = false,
				separator = "➜",
				group = "+",
			},
			show_keys = false,
			show_help = false, -- show a help message in the command line for using WhichKey
			layout = {
				align = "center",
				-- height = { min = 10, max = 35 },
				-- width = { min = 20, max = 70 },
			},
			win = {
				border = "rounded",
				title = true,
				--margin = { 1, 0, 1, 0 },
				padding = { 1, 1 }, -- extra window padding [top/bottom, right/left]
				no_overlap = true,
			},

			-- ignore
			wk.add({
				-- Harpoon
				{ "<leader>1", hidden = true },
				{ "<leader>2", hidden = true },
				{ "<leader>3", hidden = true },
				{ "<leader>4", hidden = true },
				{ "<leader>5", hidden = true },
				{ "<leader>6", hidden = true },
				{ "<leader>7", hidden = true },
				{ "<leader>8", hidden = true },
				{ "<leader>9", hidden = true },

				--
				-- { "<leader>H", hidden = true },
			}),

			wk.add({
				{ "<leader>e", desc = "Exporer" },
				{ "<leader>f", group = "Telescope" },
				{ "<leader>a", group = "Ai" },
				{ "<leader>s", group = "Sessions" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>o", group = "Options Commands" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>p", group = "Pane" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>g", group = "Git" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>c", group = "Snacks" },
				{ "<leader>u", group = "Ui" },
				{ "<leader>n", group = "Noice" },
				{ "<leader>q", group = "Quit/Session" },
				{ "<leader><TAB>", group = "Tabs" },
			}),

			wk.add({
				{ "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
			}),

			wk.add({
				-- Harpoon
				{
					"<leader>H",
					function()
						harpoon:list():add()
					end,
					group = "Harpoon Add",
					desc = "Harpoon Add",
				},
				{
					"<leader>r",
					function()
						harpoon:list():remove()
					end,
					group = "Harpoon Remove",
					desc = "Harpoon Remove",
				},
				{
					"<leader>h",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					group = "Harpoon",
					desc = "Harpoon",
				},
			}),
		})
	end,
}
