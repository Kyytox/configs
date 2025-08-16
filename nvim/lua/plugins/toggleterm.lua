return {
	{
		"akinsho/toggleterm.nvim",
		--config = true,
		cmd = "ToggleTerm",
		build = ":ToggleTerm",
		opts = {
			open_mapping = [[<F4>]],
			--direction = "horizontal",
			direction = "float",
			shade_filetypes = {},
			hide_numbers = true,
			insert_mappings = true,
			terminal_mappings = true,
			start_in_insert = false,
			close_on_exit = true,
		},
	},
}
