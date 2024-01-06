return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		auto_close = true,
	},
	keys = {
		{
			"<leader>t",
			function()
				require("trouble").toggle()
			end,
			desc = "Trouble toggle quickfix",
		},
	},
}
