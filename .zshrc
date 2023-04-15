# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=~/.config/zsh # load.zsh 使用路径

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
if [[ $(uname) == "Darwin" ]]; then
  plugins+=(brew)
fi

# source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
# . /usr/local/z/z.sh

source $ZSH/oh-my-zsh.sh

# pnpm
export PNPM_HOME="/Users/lizhi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
