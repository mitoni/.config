return {
	{
		"stevearc/oil.nvim",
		opts = {
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			require("oil").setup()
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
