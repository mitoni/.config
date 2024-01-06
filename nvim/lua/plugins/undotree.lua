return {
	{
		"https://github.com/mbbill/undotree.git",
		event = "BufEnter",
		keys = {
			{ "<leader>z", vim.cmd.UndotreeToggle, desc = "Undotree toggle" },
		},
	},
}
