return {
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lspsaga").setup({})
		end,
		keys = {
			-- {
			-- 	"<leader>ca",
			-- 	"<CMD>Lspsaga code_action<CR>",
			-- 	desc = "Code action",
			-- },
			{
				"<leader>d",
				"<CMD>Lspsaga show_cursor_diagnostics<CR>",
				desc = "Cursor diagnostics",
			},
			{
				"K",
				"<CMD>Lspsaga hover_doc<CR>",
				desc = "Hover documentation",
			},
			{
				"<leader>rn",
				"<CMD>Lspsaga rename mode=n<CR>",
				desc = "Rename",
			},
			{
				"<leader>p",
				"<CMD>Lspsaga peek_type_definition<CR>",
				desc = "Peek definition",
			},
			{
				"<leader>ic",
				"<CMD>Lspsaga incoming_calls<CR>",
				desc = "Incoming calls",
			},
			{
				"<leader>oc",
				"<CMD>Lspsaga outgoing_calls<CR>",
				desc = "Outgoing calls",
			},
		},
	},
}
