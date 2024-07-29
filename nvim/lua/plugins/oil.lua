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
                watch_for_changes = true,
                float = {
                    padding = 2,
                },
                keymaps = {
                    ["<Esc>"] = "actions.close",
                },
			})
		end,
		keys = {
			{
				"<leader>e",
				"<CMD>Oil --float<CR>",
				desc = "Open Oil file explorer",
			},
		},
	},
}
