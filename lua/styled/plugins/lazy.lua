-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if not status then
	print("Could not locate lazy plugin manager!")
	return
end

-- list of plugins to install
local plugins = {
	"LazyVim/LazyVim",

	-- miscallenous
	"mbbill/undotree",
	"echasnovski/mini.pairs", -- automatically close brackets
	"windwp/nvim-ts-autotag", -- automatically close html tags
	"nvim-tree/nvim-web-devicons",
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "folke/persistence.nvim", event = "BufReadPre" },

	-- appearance
	"folke/tokyonight.nvim", -- colorscheme
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	}, -- highlighter
	"lukas-reineke/indent-blankline.nvim", -- show line for indentation levels
	"echasnovski/mini.indentscope", -- animated borders for indentation levels
	{ "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, -- home screen
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- code completion
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"hrsh7th/cmp-nvim-lsp",

	-- lsp
	"neovim/nvim-lspconfig",
	{ "williamboman/mason.nvim", build = ":MasonUpdate" }, -- lsp manager
	"williamboman/mason-lspconfig.nvim",
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- file/folder/search finder
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	"saadparwaiz1/cmp_luasnip", -- snippet completions

	-- formatting and linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- editor
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		build = ":Neotree",
	}, -- file explorer
	"echasnovski/mini.comment", -- shortcuts for commentings
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true }, -- context aware commentings
	{ "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, -- tabs
	{ "echasnovski/mini.bufremove", version = false },
}

lazy.setup(plugins, {})
