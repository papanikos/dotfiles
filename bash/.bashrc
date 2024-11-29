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
export PATH="/home/nikos/.pixi/bin:$PATH"
export EDITOR="nvim"

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

header() {
    local sep=","
    if [ $2 ]; then
        sep=$2
    fi
    head -n1 $1 | tr $sep '\n' | cat -n
}

export MANPAGER="nvim +Man!"
export MANWIDTH=999

export BAT_THEME="Catppuccin Mocha"

eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="\
    --height 80% \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"


# Deduplicate PATH
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

[[ $PS1 && -f /usr/share/bash-completion ]] && . /usr/share/bash-completion/bash_completion


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/nikos/.pixi/envs/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/nikos/.local/share/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
