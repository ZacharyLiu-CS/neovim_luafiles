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
	vim.notify("Fail to load plugin: lazy!", "error")
	return
end

lazy.setup({
	"wbthomason/packer.nvim", -- Have packer manage itself

	-- My plugins here
	"nvim-lua/plenary.nvim", -- Lua module required by many :plugins (e.g., telescope)
	"rcarriga/nvim-notify",

	-- Color scheme
	"kyazdani42/nvim-web-devicons", -- config the icon
	"AbdelrahmanDwedar/awesome-nvim-colorschemes", -- config in colorscheme.lua file

	-- Status line
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"lewis6991/gitsigns.nvim",
	"moll/vim-bbye", -- close buffer in better way
	"aserowy/tmux.nvim",

	-- Better colorcolumn
	"m4xshen/smartcolumn.nvim",

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
	{
	  "L3MON4D3/LuaSnip",
	  -- follow latest release.
	  -- install jsregexp (optional!).
	  build = "make install_jsregexp CC=gcc"
  },
	"saadparwaiz1/cmp_luasnip",
	"zacharyliu-cs/skel-nvim",

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"nvimtools/none-ls.nvim",

	-- Code highlihting and autopairs
	{
	"nvim-treesitter/nvim-treesitter", 
   build = ":TSUpdate"
	},

	"windwp/nvim-autopairs",
		
	{
		"lukas-reineke/indent-blankline.nvim",
	},

	-- Comment
	"numToStr/Comment.nvim",

	-- Telescope with plugins
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-project.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
	},
	-- Better UI selection and input
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- Float terminal
	"akinsho/toggleterm.nvim",

	-- Project management
	"ahmedkhalf/project.nvim",

	-- Help to insert command
	{
    "folke/which-key.nvim",
  },

	-- Quick jump to other location
	{
		"folke/flash.nvim",
		event = "VeryLazy",

	},
	"folke/zen-mode.nvim",
})
