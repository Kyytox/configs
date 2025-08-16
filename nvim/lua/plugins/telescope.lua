local tel_built = require("telescope.builtin")
local ignore_filetypes_list = {
	"venv",
	"miniconda3",
	"Youtube Music",
	"__pycache__",
	"%.xlsx",
	"%.jpg",
	"%.png",
	"%.webp",
	"%.pdf",
	"%.odt",
	"%.ico",
}

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},

	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = ignore_filetypes_list,
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--fixed-strings" },
					-- find_command = { "rg", "--files", "--glob", "!**/.git/*" },
					no_ignore = true,
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>fh", tel_built.help_tags, { desc = "Help Tags" })
	end,
}
