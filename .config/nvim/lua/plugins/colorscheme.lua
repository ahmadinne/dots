return {
	{
		"Everblush/nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"comfysage/evergarden",
		lazy = false,
		priority = 1000,
		opts = {
			theme = {
				-- winter / fall / spring
				variant = "spring",
				accent = "green",
			},
			editor = {
				transparent_background = false,
				sign = { color = none },
				float = {
					color = "mantle",
					invert_border = false,
				},
				completion = {
					color = "surface0",
				},
			},
		},
	},
}
