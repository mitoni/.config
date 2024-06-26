return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			require("oil").setup({
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				columns = {
					"mtime",
					"icon",
				},
				view_options = {
					show_hidden = true,
				},
			})
		end,
		keys = {
			{
				"<leader>e",
				"<CMD>Oil<CR>",
				desc = "Open Oil file explorer",
			},
		},
	},
}
