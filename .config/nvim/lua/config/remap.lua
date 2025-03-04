-- Remaps
local remap = vim.keymap.set
local default = { noremap = true, silent = true }

-- leader
remap("n", " ", "<nop>", { silent = true, remap = false })
remap("n", "<bs>", "<nop>", { silent = true, remap = false })
vim.g.mapleader = " "
-- capital U for redo
remap("n", "U", "<c-r>")
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
