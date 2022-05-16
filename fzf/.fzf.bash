# Setup fzf
# ---------
#if [[ ! "$PATH" == */home/nikos/.fzf/bin* ]]; then
#  export PATH="${PATH:+${PATH}:}/home/nikos/.fzf/bin"
#fi
#

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.bash"

# Custom setup
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --preview 'bat --color=always {}'"
