---- ahmadinne's neovim configurations ----
--- Important ----
local global = vim.g
local setopt = vim.opt
global.mapleader = " "
global.maplocalleader = " "

require("config.lazy")
require("lazy").setup({
	spec = {
		{ "mbbill/undotree" },
		{ "tpope/vim-surround" },
		{ "lambdalisue/vim-suda" },
		{ "rachartier/tiny-glimmer.nvim" },
		{ "williamboman/mason.nvim" },
		{
			"comfysage/evergarden",
			priority = 1000,
			opts = {
				theme = {
					variant = "summer",
					accent = "green",
				},
				editor = {
					transparent_background = false,
				},
			},
			-- config = function()
			-- 	vim.cmd("colorscheme evergarden")
			-- end,
		},
		{
			"neovim/nvim-lspconfig",
			opts = { servers = { lua_ls = {} } },
			config = function(_, opts)
				local lspconfig = require("lspconfig")
				for server, config in pairs(opts.servers) do
					config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
					lspconfig[server].setup(config)
				end
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				local mason = require("mason")
				local lspconfig = require("lspconfig")
				local mspconfig = require("mason-lspconfig")
				local sure_installed = { "bashls", "lua_ls", "rust_analyzer", "biome", "pyright", "ruff" }

				mason.setup()
				mspconfig.setup({
					ensure_installed = sure_installed,
				})
				for _, lsp in pairs(sure_installed) do
					local setup = {}
					lspconfig[lsp].setup(setup)
				end
				lspconfig.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
			end,
		},
		{
			"stevearc/conform.nvim",
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						python = { "ruff_organize_imports", "ruff_format" },
						lua = { "stylua", "lua_ls" },
					},
					format_after_save = {},
				})
				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = "*",
					callback = function(args)
						require("conform").format({ bufnr = args.buf })
					end,
				})
			end,
		},
		{
			"saghen/blink.cmp",
			version = "*",
			build = "cargo build --release",
			opts = {
				keymap = { preset = "default" },
				appearance = { nerd_font_variant = "mono" },
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
			},
			opts_extend = { "sources.default" },
		},
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		},
		{
			"folke/flash.nvim",
			config = function()
				require("flash").setup()
				vim.keymap.set("n", "f", function()
					require("flash").jump({
						search = { forward = true, wrap = false, multi_window = false },
						remote_op = { restore = true, motion = nil },
					})
				end)
				vim.keymap.set("n", "F", function()
					require("flash").jump({
						search = { forward = false, wrap = false, multi_window = false },
						remote_op = { restore = true, motion = nil },
					})
				end)
			end,
		},
		{
			"stevearc/oil.nvim",
			config = function()
				require("oil").setup({
					default_file_explorer = true,
					columns = { "icon" },
					delete_to_trash = true,
					keymaps = {
						["q"] = { "actions.close", mode = "n" },
						["l"] = { "actions.select", mode = "n" },
						["h"] = { "actions.parent", mode = "n" },
						["."] = { "actions.toggle_hidden", mode = "n" },
					},
					view_options = { show_hidden = true },
				})
				vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open Parent Directory" })
			end,
		},
		{
			"brenoprata10/nvim-highlight-colors",
			config = function()
				require("nvim-highlight-colors").setup()
			end,
		},
		{
			"letieu/btw.nvim",
			config = function()
				require("btw").setup({ text = "I Use Neovim on Arch (BTW)" })
			end,
		},
		{
			"wurli/contextindent.nvim",
			config = function()
				require("contextindent").setup({ pattern = "*" })
			end,
		},
		{
			"echasnovski/mini.splitjoin",
			config = function()
				require("mini.splitjoin").setup()
			end,
		},
		{
			"echasnovski/mini.comment",
			config = function()
				require("mini.comment").setup()
			end,
		},
		{
			"echasnovski/mini.icons",
			config = function()
				require("mini.icons").setup()
			end,
		},
		{
			"epwalsh/obsidian.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("obsidian").setup({ workspaces = { { name = "Notes", path = "~/Notes" } } })
			end,
		},
	},
	checker = { enabled = true },
})

-- Options --
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
	" augroup transparentbackground
	" autocmd!
	" autocmd colorscheme * highlight nontext ctermbg=none guibg=none
	" autocmd colorscheme * highlight normal ctermbg=none guibg=none
	" augroup end
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
