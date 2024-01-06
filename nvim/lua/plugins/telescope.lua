return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,

		-- config = function()
		-- 	require("telescope").load_extension("fzf")
		-- end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>sf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Search files",
			},
			{
				"<leader>sg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Search live grep",
			},
			{
				"<leader><leader>",
				function()
					require("telescope.builtin").buffers({ sort_lastused = true })
				end,
				desc = "Search buffers",
			},
			{
				"<leader>sd",
				function()
					require("telescope.builtin").diagnostics({})
				end,
				desc = "Search diagnostics",
			},
			{
				"<leader>sh",
				function()
					require("telescope.builtin").help_tags({})
				end,
				desc = "Search diagnostics",
			},
		},
	},
}
