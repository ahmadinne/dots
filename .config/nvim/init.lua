---- ahmadinne's neovim configurations ----

-- Plugins --
require("paq")({
    -- Main Plugins
	"savq/paq-nvim",
    "stevearc/oil.nvim",
    "comfysage/evergarden",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"stevearc/conform.nvim",
    "mbbill/undotree",
    -- Others
    "tpope/vim-surround",
    "windwp/nvim-autopairs",
    "folke/flash.nvim",
    "rachartier/tiny-glimmer.nvim",
    "lambdalisue/vim-suda",
    "brenoprata10/nvim-highlight-colors",
    "letieu/btw.nvim",
    "wurli/contextindent.nvim",
    "echasnovski/mini.splitjoin",
    "echasnovski/mini.comment",
    "echasnovski/mini.icons",
    -- Obsidian.nvim
    "epwalsh/obsidian.nvim",
    "nvim-lua/plenary.nvim"
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "bashls", "lua_ls", "rust_analyzer", "biome", "pyright", "ruff" }
})

local lspconfig = require("lspconfig")
local sure_installed = { "bashls", "lua_ls", "rust_analyzer", "biome", "pyright", "ruff" }
for _, lsp in pairs(sure_installed) do
	local setup = {}
	lspconfig[lsp].setup(setup)
end

lspconfig.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

require("conform").setup({
	formatters_by_ft = {
		python = { "ruff_organize_imports", "ruff_format" },
        lua = { "lua_ls" }
	},
	format_after_save = {},
})

require("oil").setup({
    default_file_explorer = true,
    columns = { "icon" },
    delete_to_trash = true,
    keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["l"] = { "actions.select", mode = "n" },
        ["h"] = { "actions.parent", mode = "n" },
        ["."] = { "actions.toggle_hidden", mode = "n" }
    },
    view_options = { show_hidden = true }
})
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open Parent Directory"} )

require("flash").setup()
vim.keymap.set("n", "f", function()
    require("flash").jump({ search = { forward = true, wrap = false, multi_window = false }, remote_op = { restore = true, motion = nil }})
end)
vim.keymap.set("n", "F", function()
    require("flash").jump({ search = { forward = false, wrap = false, multi_window = false }, remote_op = { restore = true, motion = nil }})
end)

require("btw").setup({ text = "I Use Neovim on Arch (BTW)"})
require("contextindent").setup({ pattern = "*" })
require("nvim-autopairs").setup()
require("nvim-highlight-colors").setup()
require("obsidian").setup({ workspaces = { { name = "Notes", path = "~/Notes" } } })
require("mini.splitjoin").setup()
require("mini.comment").setup()
require("mini.icons").setup()

-- Options --
local global = vim.g
local setopt = vim.opt

global.mapleader = " "
global.maplocalleader = " "

setopt.wrap = true
setopt.smarttab = true
setopt.autoindent = true
setopt.cindent = true
setopt.tabstop = 4
setopt.softtabstop = 4
setopt.shiftwidth = 4
setopt.expandtab = true
setopt.breakindent = true
setopt.textwidth = 0
setopt.autochdir = true

setopt.number = true
setopt.relativenumber = true
setopt.title = true
setopt.ruler = true
setopt.syntax = "on"
setopt.hidden = true
setopt.modelines = 1
setopt.hlsearch = true
setopt.laststatus = 2
setopt.cursorline = true
global.have_nerd_font = true
setopt.termguicolors = true
vim.schedule(function()
	setopt.clipboard = "unnamedplus"
end)
setopt.splitright = true

vim.opt_local.conceallevel = 2
vim.cmd([[
	augroup transparentbackground
	autocmd!
	autocmd colorscheme * highlight nontext ctermbg=none guibg=none
	autocmd colorscheme * highlight normal ctermbg=none guibg=none
	augroup end
    colorscheme evergarden
]])


---- Remaps ----
local remap = vim.keymap.set
local default = { noremap = true, silent = true }

-- Custom Command
vim.cmd([[
    cnoreabbrev sw :SudaWrite<cr>
    cnoreabbrev ws :SudaWrite<cr>

    cnoreabbrev sq :SudaWrite<cr>
    cnoreabbrev qs :SudaWrite<cr>

    cnoreabbrev fw :SudaWrite<cr>
    cnoreabbrev wf :SudaWrite<cr>


    cnoreabbrev fq :SudaWrite<cr>
    cnoreabbrev qf :SudaWrite<cr>
]])

-- leader
remap("n", " ", "<nop>", { silent = true, remap = false })
remap("n", ",", "<nop>", { silent = true, remap = false })
remap("n", "<bs>", "<nop>", { silent = true, remap = false })

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

-- Switch buffer and windows
remap("n", "gb", "<cmd>bn<cr>")
remap("n", "gB", "<cmd>bp<cr>")
remap("n", "gw", "<c-w>w")
remap("n", "gW", "<c-w>W")
remap("n", "<S-J>", "<cmd>bp<cr>")
remap("n", "<S-K>", "<cmd>bn<cr>")

-- Undotree
remap("n", "<leader>ut", vim.cmd.UndotreeToggle)
