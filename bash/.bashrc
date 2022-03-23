# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Use dircolors -p to get an idea how things should be named
#export LS_COLORS='or=05;36;41:*.zip=01;31:*.gz=01;31:*.svg=00;35:*.png=00;35:*.jpg=00;35:*.deb=01;37;41:'
export LS_COLORS="$(vivid generate $HOME/.config/vivid/snazcery.yml)"

HISTCONTROL=ignoreboth
export HISTIGNORE='cd*:ls*'

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nikos/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nikos/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nikos/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nikos/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Custom software
export PATH="/home/nikos/bin:$PATH"

## Singularity requirements
export PATH="$PATH:/usr/local/go/bin"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"

# rustup.rs
. "$HOME/.cargo/env"

# Alacritty bash completion
source /home/nikos/Tools/alacritty/extra/completions/alacritty.bash
# Awesome window manager keyring for ssh

if [ "$DESKTOP_SESSION" == "awesome" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# FZF through git
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Zoxide
eval "$(zoxide init bash)"