return {
	{
		"numToStr/Comment.nvim",
		event = "BufEnter",
		config = function()
			-- Setup file specific comments
			require("Comment.ft").set("typescriptreact", "{/* %s */}")
			require("Comment").setup()
		end,
	},
}
