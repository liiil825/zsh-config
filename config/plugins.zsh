source $ZSH_CUSTOM/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -M emacs '^K' history-substring-search-up
bindkey -M emacs '^J' history-substring-search-down

# eval "$(lua $ZSH_CUSTOM/plugins/z.lua/z.lua --init echo enhanced zsh)"
