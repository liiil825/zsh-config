export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

# export FZF_DEFAULT_OPTS='-i --height=50%'

alias fcd='cd $(fd . ~ -t d | fzf --height=40% --layout=reverse)'
alias fcdc='cd $(fd . ~/.config -t d | fzf --height=40% --layout=reverse)'
