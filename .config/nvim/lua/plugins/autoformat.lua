return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					c = { "clang-format" },
					css = { "css_beautify" },
					lua = { "stylua" },
					bash = { "beautysh" },
					json = { "jq", "fixjson" },
					html = { "html_beautify" },
					markdown = { "mdformat" },
					javascript = { "js_beautify" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup({
				ignore_install = { "prettier" },
			})
		end,
	},
}
