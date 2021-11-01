# dotfiles

Config files.

_There are many like these but these are mine._

The idea is to use stow. Haven't tried it yet on a new machine.

At least now they are backed up...

Handle with care.

## VIM

* Install [vim-plug](https://github.com/junegunn/vim-plug)

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

* From a terminal

```
$ vim +PlugInstall +qall
```

