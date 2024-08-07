return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
			end, { range = true })

			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	pattern = "*",
			-- 	callback = function(args)
			-- 		require("conform").format({ bufnr = args.buf })
			-- 	end,
			-- })

			require("conform").setup({
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
				formatters_by_ft = {
					lua = { "stylua" },

					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },

					javascriptreact = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },

					json = { "prettierd", "prettier" },

                    html = { "prettierd", "prettier" },
                    css = { "prettierd", "prettier" },
                    less = { "prettierd", "prettier" },

					["*"] = {},
					["_"] = {},
				},
			})
		end,
	},
}
