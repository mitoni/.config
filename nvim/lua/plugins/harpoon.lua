return {
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
                "<C-h>",
				function()
					require("harpoon.mark").add_file()
                    vim.notify("Added file to harpoon", vim.log.levels.INFO, { title = "Harpoon" })
				end,
			},
            {
                "<leader>h",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
            },
			{
				"<C-k>",
				function()
					require("harpoon.ui").nav_next()
				end,
			},
			{
				"<C-j>",
				function()
					require("harpoon.ui").nav_prev()
				end,
			},
		},
	},
}
