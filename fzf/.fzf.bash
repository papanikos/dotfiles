# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nikos/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nikos/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nikos/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/nikos/.fzf/shell/key-bindings.bash"

# Custom setup
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --preview 'bat --color=always {}'"
