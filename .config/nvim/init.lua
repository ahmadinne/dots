-- Veillain's Neovim init.lua
local global = vim.g

-- Basic Settings
vim.opt.mouse = "a"
vim.opt.title = true
vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.splitright = true

-- Indentation Settings
vim.opt.wrap = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- Use space instead of tab chars.
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.textwidth = 0
vim.opt.autochdir = true

vim.opt_local.conceallevel = 2

-- colorscheme then Lazy.nvim
require("config.lazy")
vim.cmd([[
	augroup transparentbackground
	autocmd!
	autocmd colorscheme * highlight nontext ctermbg=none guibg=none
	autocmd colorscheme * highlight normal ctermbg=none guibg=none
	augroup end
]])
vim.cmd("colorscheme everblush")
