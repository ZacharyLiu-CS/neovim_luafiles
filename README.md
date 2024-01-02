# Zach's Neovim Plugins Repo

Those plugins can work together to provide an IDE-like experience (e.g., vscode, idea).
You can toggle between different files, search and jump any files by you want, enjoy the
smart code hints, completion and diagnosis after integrating morden language LSP servers.

This repo is highly inspired by [@ChristianChiarulli](https://github.com/ChristianChiarulli) of his video: [Neovim IDE from Scratch - Introduction (100% lua config)](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ). Great thanks for him!

## Pre-installed packages

1. unzip
2. npm
3. ncdu
4. xsel
5. tmux
6. ripgrep
7. fd
8. gcc, clang, rust, python, lua, node, zig
9. htop
10. lazygit
11. stylua
12. rustfmt
13. npm packages: write-good, prettier  
    (For markdown highlighting by null-ls)
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

```
[[ -n $TMUX ]] && export TERM="screen-256color"
```

2. set in ~/.tmux.conf file

```
set-option -sg escape-time 10
set-option -g focus-events on
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color*:RGB"
```

## Plugins list and effect

(in lua/plugins/catalogs.lua, using lazy to manage all plugins)

## Update
```lua
:Lazy update
:TSUpdate
:Mason && U(update)
```

## Key bindings

---

### Basic function

| Key                      | Mode          | Effect                                       |
| ------------------------ | ------------- | -------------------------------------------- |
| space                    | normal        | leader key                                   |
| `<C-q>`                  | visual        | select blocks by column                      |
| `<C-s>`                  | normal        | save buffer                                  |
| `<C-w>`                  | normal        | close buffer                                 |
| `<C-h/j/k/l>`            | normal        | toggle window                                |
| `<C-Up/Down/Left/Right>` | normal        | resize window                                |
| `<S-h/l>`                | normal        | toggle buffer                                |
| `<A-j/k>`                | normal/visual | move text up and down                        |
| `</>`                    | visual        | move text left and right                     |
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

### flash 
| Key       | Mode   | Effect                                           |
| ----------| ------ | ------------------------------------------------ |
| `/`       | normal |  regular search and jump                         |
| `?`       | normal |  regular search and jump                         |
| `s`       | normal |  enter jump mode                                 |
| `S`       | normal |  enter flash treesitter                          |
| `f`/`t`   | normal |  find {char} and jump to next char with `f`/`t`  |
| `F`/`T`   | normal |  find {char} and jump to prev char with `F`/`T`  |


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

### Treesitter textobjects select

| Key | Mode   | Effect       |
| --- | ------ | ------------ |
| `.` | visual | smart select |
| `,` | visual | last select  |

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

| Key           | Mode   | Effect                                  |
| ------------- | ------ | --------------------------------------- |
| `gcc`         | normal | line-comment toggle                     |
| `gbc`         | normal | block-comment toggle                    |
| `gc`          | visual | line-comment toggle                     |
| `gb`          | visual | block-comment toggle                    |
| `gco/gcO/gcA` | normal | add comment on the line above/below/end |

### Telescope

| Key          | Mode   | Effect           |
| ------------ | ------ | ---------------- |
| `<leader>ff` | normal | find files       |
| `<leader>fg` | normal | fuzzy grep       |
| `<leader>fp` | normal | toggle projects  |
| `<leader>fb` | normal | find buffers     |
| `<leader>fB` | normal | checkout branch  |
| `<leader>fh` | normal | find help flags  |
| `<leader>fm` | normal | find keymaps     |
| `<leader>fc` | normal | Commands         |
| `<leader>fC` | normal | Colorscheme      |
| `<leader>fM` | normal | Man Pages"       |
| `<leader>fr` | normal | Open Recent File |
| `<leader>fR` | normal | Registers        |

### Toggleterm

| Key          | Mode   | Effect                       |
| ------------ | ------ | ---------------------------- |
| `<C-\>`      | normal | enable or disable a terminal |
| `<leader>ty` | normal | open python in terminal      |
| `<leader>tn` | normal | open nodejs in terminal      |
| `<leader>tu` | normal | open ncdu in terminal        |
| `<leader>tt` | normal | open htop in terminal        |
| `<leader>tp` | normal | open python in terminal      |
| `<leader>tg` | normal | open lazygit in terminal     |
| `<leader>tf` | normal | open a float terminal        |
| `<leader>th` | normal | open a horizontal terminal   |
| `<leader>tv` | normal | open a vertical terminal     |

### ZenMode

| Key          | Mode   | Effect                       |
| ------------ | ------ | ---------------------------- |
| `<leader>zz` | normal | Enter zen mode |
| `<leader>zc` | normal | Leave zen mode | 

