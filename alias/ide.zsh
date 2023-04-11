#!/bin/zsh

alias ra="ranger"
alias vim="nvim"
alias v="nvim"

export VISUAL=nvim
export EDITOR=$VISUAL

alias nvim-lazy="NVIM_APPNAME=nvim-lazy nvim"
alias nvim-kick="NVIM_APPNAME=nvim-kickstart nvim"
alias nvim-chad="NVIM_APPNAME=nvim-nvchad nvim"
alias nvim-astro="NVIM_APPNAME=nvim-astro nvim"
alias nvim-primeagen="NVIM_APPNAME=nvim-primeagen nvim"
alias nvim-lizhi="NVIM_APPNAME=nvim-lizhi nvim"

function nvims() {
  itemNames=("default" "Kickstart" "LazyVim" "NvChad" "AstroNvim" "ThePrimeagen" "lizhi")
  itemAlias=("default" "nvim-kickstart" "nvim-lazy" "nvim-nvchad" "nvim-astro" "nvim-primeagen" "nvim-lizhi")
  config=$(printf "%s\n" "${itemNames[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)

  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    echo "Selected default config"
    config=""
  fi

  for ((i=0;i < $#itemAlias; i+=1)); do
    if [[ "${itemNames[$i]}" == "$config" ]]; then
      config="${itemAlias[$i]}"
      break
    fi
  done

  NVIM_APPNAME=$config nvim $@
}