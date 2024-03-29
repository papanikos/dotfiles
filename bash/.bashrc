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
export LS_COLORS="$(vivid generate $HOME/.config/vivid/catppuccin.yml)"

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

keychain id_ed25519
. $HOME/.keychain/`uname -n`-sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/nikos/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/nikos/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/nikos/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/nikos/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# Custom software
export PATH="$HOME/.local/bin:$PATH"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"

# rustup.rs
. "$HOME/.cargo/env"


source ~/.bash_completion/alacritty

# Node - mostly for luavim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Zoxide
eval "$(zoxide init bash)"
