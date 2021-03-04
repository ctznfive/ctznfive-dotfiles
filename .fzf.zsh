# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ctznfive/bin/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ctznfive/bin/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ctznfive/bin/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ctznfive/bin/fzf/shell/key-bindings.zsh"
