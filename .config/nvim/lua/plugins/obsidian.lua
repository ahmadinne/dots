return {
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "Notes",
					path = "~/Notes",
				},
			},
		},
	},
	{
		"wthollingsworth/pomodoro.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.g.pomodoro_time_work = 25
			vim.g.pomodoro_time_break_short = 5
			vim.g.pomodoro_time_break_long = 20
			vim.g.pomodoro_timers_to_long_break = 4
		end,
	},
}
