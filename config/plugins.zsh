source $ZSH_CUSTOM/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Bind up/down arrow keys to navigate through your history
bindkey '\e[A' directory-history-search-backward
bindkey '\e[B' directory-history-search-forward

# Bind CTRL+k and CTRL+j to substring search
bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down

eval "$(lua $ZSH_CUSTOM/plugins/z.lua/z.lua --init echo enhanced zsh)"
