-- Veillain's Neovim init.lua
local global = vim.g
local remap = vim.keymap.set
local setopt = vim.opt
local default = { noremap = true, silent = true }

---- Remaps ----
-- leader
remap("n", " ", "<nop>", { silent = true, remap = false })
remap("n", "<bs>", "<nop>", { silent = true, remap = false })
vim.g.mapleader = " "
-- leader + / remove highlight
remap("n", "<leader>/", "<cmd>noh<cr>")
remap("n", "gh", "<cmd>noh<cr>")
-- p doesn't override clipboard
remap("x", "<leader>p", '"_dP')
-- x doesn't override clipboard
remap("n", "x", '"_x')
remap("n", "X", '"_X')
-- Unmap ctrl+q (visual block, same as ctrl+v)
remap("n", "<c-q>", "", default)
-- Escape to Esc-l
remap("i", "<esc>", "<esc>l", default)

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
require("lazy")
vim.cmd([[
	augroup transparentbackground
	autocmd!
	autocmd colorscheme * highlight nontext ctermbg=none guibg=none
	autocmd colorscheme * highlight normal ctermbg=none guibg=none
	augroup end
]])
-- vim.cmd("colorscheme everblush")
