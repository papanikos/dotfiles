# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Custom software
export PATH="/home/nikos/.local/bin:$PATH"
export EDITOR="hx"

# SSH keys in keychain
keychain --quiet id_ed25519
. $HOME/.keychain/$(uname -n)-sh

# rustup.rs
. "$HOME/.cargo/env"
export PATH="$PATH:$HOME/.cargo/bin"

HISTCONTROL=ignoreboth
export HISTIGNORE='cd*:ls*'
# Share history across shells
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi


# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"

# Zoxide
eval "$(zoxide init bash)"

# Custom functions
removecontainers() {
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)
}

armageddon() {
	removecontainers
	docker network prune -f
	docker rmi -f $(docker images --filter dangling=true -qa)
	docker volume rm $(docker volume ls --filter dangling=true -q)
	docker rmi -f $(docker images -qa)
}

#Load some secrets
if [ -f "/home/nikos/.secrets.sh" ]; then
	source ~/.secrets.sh
fi

it-workers() {
	docker exec -it tlapp_workers bash
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nikos/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nikos/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/nikos/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nikos/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/nikos/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/nikos/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

