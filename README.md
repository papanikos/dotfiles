# dotfiles

My config files for various programs I use.

_There are many like these but these are mine._

Handled with stow.

## Packages/Programs

- alacritty (terminal)
- vim (editor)
- tmux, byobu (terminal multiplexer)
- vivid (pretty dircolors)
- starship (custom prompt)
- conda (package management, in user space and mostly scientific stuff)
- awesome (tiling window manager - Buggy with GNOME)
- bash (shell)

## Program specific notes

### VIM

1. Install [vim-plug](https://github.com/junegunn/vim-plug)

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. From a terminal

```
$ vim +PlugInstall +qall
```
