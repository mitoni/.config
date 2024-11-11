return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",

			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",

			"williamboman/mason-lspconfig.nvim",
		},
		buid = "make install_jsregexp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.config.setup()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer", max_item_count = 10 },
				}, {
					{ name = "path", max_item_count = 5 },
					{ name = "luasnip", max_item_count = 5 },
					-- { name = "cmdline" },
				}),

				mapping = cmp.mapping.preset.insert({
					-- ["<C-j>"] = cmp.mapping.select_next_item(),
					-- ["<C-k>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({
						select = true,
					}),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
			})
		end,
	},
}
