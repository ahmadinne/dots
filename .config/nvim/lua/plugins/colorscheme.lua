return {
	{
		"Everblush/nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme tokyonight")
		-- end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme rose-pine-moon")
		-- end,
	},
	{
		"comfysage/evergarden",
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			theme = {
				variant = "winter", -- 'winter'|'fall'|'spring'
				accent = "green",
			},
			editor = {
				transparent_background = true,
				sign = { color = "none" },
				float = {
					color = "mantle",
					invert_border = false,
				},
				completion = {
					color = "surface0",
				},
			},
		},
		config = function()
			vim.cmd("colorscheme evergarden")
		end,
	},
}
