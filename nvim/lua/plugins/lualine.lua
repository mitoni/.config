return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = " ",
			},
			sections = {
				lualine_c = { { "filename", path = 1 }, "lsp_progress" },
			},
		},
	},
}
