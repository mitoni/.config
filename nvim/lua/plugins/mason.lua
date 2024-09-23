return {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig" },
		config = function()
			local mason = require("mason")
			mason.setup({})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local mason_lspconfig = require("mason-lspconfig")
			local servers = mason_lspconfig.get_installed_servers()

			mason_lspconfig.setup({
				ensure_installed = { "clangd", "tsserver", "eslint", "gopls", "pyright"  },
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
						on_init = function(client)
							local path = client.workspace_folders[1].name
							if
								not vim.loop.fs_stat(path .. "/.luarc.json")
								and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
							then
								client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
									Lua = {
										runtime = {
											version = "LuaJIT",
										},
										workspace = {
											checkThirdParty = false,
											library = {
												vim.env.VIMRUNTIME,
											},
										},
									},
								})

								client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
							end
							return true
						end,
					})
				end,
			})
		end,
	},
}
