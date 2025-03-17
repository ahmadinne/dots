return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"lua_ls",
					"rust_analyzer",
					"biome",
					-- "harper_ls",
					-- "pkgbuild_language_server",
				},
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = { "mfussenegger/nvim-lint" },
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = { "bash" },
				-- ignore_install = {},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				lua_ls = {},
				bashls = {},
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			lspconfig["lua_ls"].setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
			lspconfig.bashls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.biome.setup({})
			lspconfig.harper_ls.setup({})
			-- lspconfig.pkgbuild_language_server.setup({})
		end,
	},
}
