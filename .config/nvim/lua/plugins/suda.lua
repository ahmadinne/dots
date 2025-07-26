return {
	{
		"https://github.com/lambdalisue/vim-suda",
		config = function()
			vim.cmd([[
				let g:suda#prompt = "Pass: "
				cnoreabbrev W! w!
				cnoreabbrev W w
				cnoreabbrev Q! q!
				cnoreabbrev Q q
				cnoreabbrev WQ wq
				cnoreabbrev Wq wq
				cnoreabbrev wQ wq
				cnoreabbrev wf SudaWrite
				cnoreabbrev Wf SudaWrite
				cnoreabbrev wF SudaWrite
			]])
		end,
	},
}
