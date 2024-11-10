return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				pickers = {
					sort_lastused = true,
				},
			})
		end,
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
				"<leader>sw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Search word",
			},
			{
				"<leader>sh",
				function()
					require("telescope.builtin").help_tags({})
				end,
				desc = "Help tags",
			},
			{
				"<leader>sr",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume search",
			},
			{
				"<leader>gr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "Goto References",
			},
		},
	},
}
