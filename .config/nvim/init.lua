-- Veillain's Neovim init.lua
local global = vim.g
local setopt = vim.opt

-- Leader Settings
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Basic Settings
setopt.mouse = "a"
setopt.title = true
setopt.ruler = true
setopt.hidden = true
setopt.syntax = "on"
setopt.number = true
setopt.relativenumber = true
setopt.hlsearch = true
setopt.laststatus = 2
setopt.cursorline = true
vim.g.have_nerd_font = true
setopt.termguicolors = true
vim.schedule(function()
	setopt.clipboard = "unnamedplus"
end)
setopt.splitright = true

-- Indentation Settings
setopt.wrap = true
setopt.smarttab = true
setopt.autoindent = true
setopt.cindent = true
setopt.tabstop = 4
setopt.softtabstop = 4
setopt.shiftwidth = 4
-- Use space instead of tab chars.
setopt.expandtab = true
setopt.breakindent = true
setopt.textwidth = 0
setopt.autochdir = true

vim.opt_local.conceallevel = 2

-- colorscheme then Lazy.nvim
require("config.lazy")
require("config.remap")
vim.cmd([[
	augroup transparentbackground
	autocmd!
	autocmd colorscheme * highlight nontext ctermbg=none guibg=none
	autocmd colorscheme * highlight normal ctermbg=none guibg=none
	augroup end
    colorscheme evergarden
]])
