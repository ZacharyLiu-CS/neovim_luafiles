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

-- a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	vim.notify("load lazy modue failed!")
	return
end

lazy.setup({
	"wbthomason/packer.nvim", -- Have packer manage itself

	-- My plugins here
	"nvim-lua/plenary.nvim", -- Lua module required by many :plugins (e.g., telescope)

	-- Color scheme
	"kyazdani42/nvim-web-devicons", -- config the icon
	"AbdelrahmanDwedar/awesome-nvim-colorschemes", -- config in colorscheme.lua file

	-- Status line
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"lewis6991/gitsigns.nvim",
	"moll/vim-bbye", -- close buffer in better way
	"aserowy/tmux.nvim",

	-- File exploer
	"kyazdani42/nvim-tree.lua",

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lua",
	"onsails/lspkind-nvim",
	"rafamadriz/friendly-snippets",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"RRethy/vim-illuminate",

	-- Code highlihting and autopairs
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"RRethy/nvim-treesitter-textsubjects",
		},
	},

	"windwp/nvim-autopairs",
	"lukas-reineke/indent-blankline.nvim",

	-- Comment
	"numToStr/Comment.nvim",

	-- Fuzzy search
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-project.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
	},
	-- Telescope plugins

	-- Float terminal
	"akinsho/toggleterm.nvim",

	-- Project management
	"ahmedkhalf/project.nvim",

	-- Fast start
	"lewis6991/impatient.nvim",

	"folke/which-key.nvim",
})
