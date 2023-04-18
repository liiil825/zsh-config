ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ $(uname) == "Linux" ]]; then
    TERM="xterm-256color"
elif [[ $(uname) == "Darwin" ]]; then
    TERM="screen-256color"
fi

source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

