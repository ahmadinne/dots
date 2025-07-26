---- Ahmadinne's Neovim Configurations ----
--- @kickstart & @lazy.nvim

---- Settings ----
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
--- disable if you using status line plugins
vim.o.showmode = true
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 0
vim.o.confirm = true

---- Keymaps ----
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-j>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-l>", { desc = "Move focus to the right window" })

vim.keymap.set("n", "<C-S-j>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-k>", "<C-w>L", { desc = "Move window to the right" })

---- Lazy.nvim ----
require("config.lazy")
