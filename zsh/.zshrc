# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nikos/.zshrc'

compinit
# End of lines added by compinstall

export PATH="/home/nikos/.local/bin:$PATH"
export PATH="/home/nikos/.pixi/bin:$PATH"
export PATH="/home/nikos/go/bin:$PATH"

export EDITOR="nvim"

autoload -Uz compinit

# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# FZF
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS="\
    --height 80% \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Zoxide
eval "$(zoxide init zsh)"

# atuin
eval "$(atuin init --disable-up-arrow zsh)"

# aliases
alias ls="ls --color=auto"
alias ll="eza -al --group-directories-first --icons=always"
alias rsync="rsync -av --progress"
alias update="sudo apt update && sudo apt upgrade"
alias gs="git status"
alias cat="bat"
alias vim="nvim"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/nikos/.pixi/envs/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/nikos/.local/share/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
#

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list --icons | fzf --height 40% --ansi --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
