return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufEnter",
		main = "ibl",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
				},
                scope = {
                    enabled = true,
                    show_start = false,
                    show_end = false,
                }

			})
		end,
	},
}
