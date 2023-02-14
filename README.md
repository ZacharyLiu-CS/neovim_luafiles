# Targets

This repo works for tracking my lua config files of neovim.

## Pre-installed packages

1. unzip
2. npm
3. ncdu
4. xsel
5. tmux
6. ripgrep
7. fd
8. gcc, clang, rust, python, lua, node
9. htop
10. lazygit
11. stylua
12. rustfmt
13. npm packages: write-good, prettier  (For markdown highlighting by null-ls) 
    `npm install -g write-good/prettier`

## Clipboard Settings

- |g:clipboard|
- pbcopy, pbpaste (macOS)
- wl-copy, wl-paste (if $WAYLAND_DISPLAY is set)
- xclip (if $DISPLAY is set; if not, it will cause nvim to get stuck)
- xsel (if $DISPLAY is set)
- lemonade (for SSH) https://github.com/pocke/lemonade
- doitclient (for SSH) https://www.chiark.greenend.org.uk/~sgtatham/doit/
- win32yank (Windows)
- termux (via termux-clipboard-set, termux-clipboard-set)
- tmux (if $TMUX is set)

## Tmux true color settings

1. set $TERM variable of shell (e.g., .bashrc, .zshrc)
`export TERM=screen-256color`

2. set in ~/.tmux.conf file 
```
set-option -sg escape-time 10
set-option -g focus-events on
set -g default-terminal "screen-256color"
set-option -ga terminal-overrides ",screen-256color:RGB"
```

## Plugins list and effect

(in lua/plugins/catalogs.lua)

```
  use 'wbthomason/packer.nvim'                  -- Have packer manage itself

  -- My plugins here
  use "nvim-lua/plenary.nvim"                   -- Lua module required by many plugins (e.g., telescope)

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
```

## Key bindings

---

### Basic function

| Key                      | Mode          | Effect                                       |
| ------------------------ | ------------- | -------------------------------------------- |
| space                    | normal        | leader key                                   |
| `<C-q>`                  | virsual       | select blocks by column                      |
| `<C-h/j/k/l>`            | normal        | toggle window                                |
| `<C-Up/Down/Left/Right>` | normal        | resize window                                |
| `<S-h/l>`                | normal        | toggle buffer                                |
| `<A-j/k>`                | normal/visual | move text up and down                        |
| `</>`                    | virsual       | move text left and right                     |
| `jk/kj`                  | insert        | fast exit                                    |
| `<leader>sv/sh`          | normal        | split the windows vertically or horizontally |

### Tmux

| Key           | Mode   | Effect      |
| ------------- | ------ | ----------- |
| space         | normal | leader key  |
| `<C-h/j/k/l>` | normal | toggle pane |

### Buffer line

| Key                        | Mode   | Effect                                         |
| -------------------------- | ------ | ---------------------------------------------- |
| `<C-w>`                    | normal | close the buffer                               |
| `right click on tab`       | normal | show the buffer in a vertically splited window |
| `left click on close icon` | normal | close the buffer                               |

### NVimTree

| Key         | Mode   | Effect                                  |
| ----------- | ------ | --------------------------------------- |
| `<leader>e` | normal | activate/deactivate the NVimTree window |
| `l`         | /      | edit file                               |
| `h`         | /      | close node                              |
| `v`         | /      | edit file in a vsplit window            |
| `a`         | /      | create file                             |
| `c`         | /      | copy file                               |
| `x`         | /      | cut file                                |
| `p`         | /      | paste file                              |
| `d`         | /      | remove file                             |
| `r`         | /      | rename file                             |
| `y`         | /      | copy name                               |
| `Y`         | /      | copy path                               |

### Completion

| Key       | Mode   | Effect                    |
| --------- | ------ | ------------------------- |
| `<C-j/k>` | insert | select the next/prev item |
| `<C-b/f>` | insert | scroll docs up/down       |
| `<C-e>`   | insert | abort the completion      |
| `<Tab>`   | insert | select the next item      |

### LSP

| Key          | Mode   | Effect                   |
| ------------ | ------ | ------------------------ |
| `<A-f>`      | normal | lsp format               |
| `<A-d`       | normal | lsp diagnostic list      |
| `gD`         | normal | go to declaration        |
| `gd`         | normal | go to definition         |
| `gr`         | normal | go to references         |
| `gl`         | normal | open diagnostic in float |
| `gI`         | normal | go to implementation     |
| `<leader>li` | normal | view LspInfo             |
| `<leader>lr` | normal | lsp rename               |

### Comment

| Key           | Mode    | Effect                                  |
| ------------- | ------- | --------------------------------------- |
| `gcc`         | normal  | line-comment toggle                     |
| `gbc`         | normal  | block-comment toggle                    |
| `gc`          | virsual | line-comment toggle                     |
| `gb`          | virsual | block-comment toggle                    |
| `gco/gcO/gcA` | normal  | add comment on the line above/below/end |

### Telescope

| Key          | Mode   | Effect          |
| ------------ | ------ | --------------- |
| `<leader>ff` | normal | find files      |
| `<leader>fg` | normal | fuzzy grep      |
| `<leader>fb` | normal | find buffers    |
| `<leader>fh` | normal | find help flags |
| `<leader>fm` | normal | find keymaps    |
| `<leader>fp` | normal | toggle projects |

### Toggleterm

| Key          | Mode   | Effect                       |
| ------------ | ------ | ---------------------------- |
| `<C-\>`      | normal | enable or disable a terminal |
| `<leader>lg` | normal | open lazygit in terminal     |
| `<leader>no` | normal | open nodejs in terminal      |
| `<leader>nc` | normal | open ncdu in terminal        |
| `<leader>ht` | normal | open htop in terminal        |
| `<leader>py` | normal | open python in terminal      |
