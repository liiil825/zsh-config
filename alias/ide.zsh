alias ra="ranger"
alias vim="nvim"
alias v="nvim"

export VISUAL=nvim
export EDITOR=$VISUAL

alias nvim-lazy="NVIM_APPNAME=nvim-lazy"
alias nvim-kick="NVIM_APPNAME=nvim-kickstart"
alias nvim-chad="NVIM_APPNAME=nvim-nvchad"
alias nvim-astro="NVIM_APPNAME=nvim-astro"
alias nvim-lizhi="NVIM_APPNAME=nvim-lizhi"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim" "lizhi")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
