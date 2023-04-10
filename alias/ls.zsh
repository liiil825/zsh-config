unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

if [[ "$(uname -s)" == "Linux" ]]; then
  alias ls="ls --color=auto"
else
  alias ls="gls --color=auto"
fi
