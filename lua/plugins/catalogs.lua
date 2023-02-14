local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost catalogs.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("load packer modue failed!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'                  -- Have packer manage itself

  -- My plugins here
  use "nvim-lua/plenary.nvim"                   -- Lua module required by many :plugins (e.g., telescope)

  -- Color scheme
  use "folke/tokyonight.nvim"                   -- config in colorscheme.lua file
  use "kyazdani42/nvim-web-devicons"            -- config the icon
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Status line
  use "nvim-lualine/lualine.nvim"
  use "akinsho/bufferline.nvim"
  use "lewis6991/gitsigns.nvim"
  use "moll/vim-bbye"                          -- close buffer in better way
  use "aserowy/tmux.nvim"

  -- File exploer
  use "kyazdani42/nvim-tree.lua"

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'onsails/lspkind-nvim'
  use 'rafamadriz/friendly-snippets'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "RRethy/vim-illuminate"

  -- Code highlihting and autopairs
  use "nvim-treesitter/nvim-treesitter"
  use "windwp/nvim-autopairs"
  use "lukas-reineke/indent-blankline.nvim"

  -- Comment
  use "numToStr/Comment.nvim"

  -- Fuzzy search
  use "nvim-telescope/telescope.nvim"
    -- Telescope plugins
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "nvim-telescope/telescope-project.nvim"


  -- Float terminal
  use "akinsho/toggleterm.nvim"

  -- Project management
  use "ahmedkhalf/project.nvim"

  -- Fast start
  use "lewis6991/impatient.nvim"




  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
