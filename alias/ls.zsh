unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

if [[ "$(OS)" == "Linux" ]]; then
  alias ls="ls --color=auto"
else
  alias ls="gls --color=auto"
fi
