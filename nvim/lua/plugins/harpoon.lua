return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon.mark").add_file()
				end,
			},
			{
				"<C-.>",
				function()
					require("harpoon.ui").nav_next()
				end,
			},
			{
				"<C-,>",
				function()
					require("harpoon.ui").nav_prev()
				end,
			},
			{
				"<leader>hh",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
			},
		},
	},
}
