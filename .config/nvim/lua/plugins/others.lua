return {
	{ "lambdalisue/vim-suda" },
	{ "brenoprata10/nvim-highlight-colors" },
	{ "ck-zhang/obfuscate.nvim" },
	{
		"wurli/contextindent.nvim",
		opts = { pattern = "*" },
	},
	{
		"rachartier/tiny-glimmer.nvim",
		event = "VeryLazy",
		priority = 10,
		opts = {
			enabled = true,
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"letieu/btw.nvim",
		config = function()
			require("btw").setup({
				text = "I use Neovim (on Archlinux BTW)",
			})
		end,
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("nvim-highlight-colors").setup()
			require("nvim-autopairs").setup()
			require("mini.statusline").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
			require("mini.tabline").setup()
			require("mini.comment").setup()
		end,
	},
}
