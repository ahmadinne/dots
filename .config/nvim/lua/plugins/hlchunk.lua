return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			enable = true,
			style = {},
			notify = false,
			priority = 0,
			exclude_filetypes = {
				aerial = true,
				dashboard = true,
				-- some other filetypes
			},
		},
		config = function()
			require("hlchunk").setup({
				chunk = { enable = true },
				line_num = { enable = true },
				indent = {
					enable = true,
					-- chars = { "." },
					-- style = {},
				},
				blank = {
					enable = false,
					chars = { "-" },
					style = {
						{ bg = "#181818" },
					},
				},
			})
		end,
	},
}
