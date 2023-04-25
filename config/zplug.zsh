#! /usr/bin/env zsh
if [[ $(uname -n) == *"-opencloudos" ]]; then
  return
fi

if [[ $(uname) == "Darwin" ]]; then
  export ZPLUG_HOME=/usr/local/opt/zplug
elif [[ $(uname) == "Linux" ]]; then
  export ZPLUG_HOME=~/.config/zplug
  # Check if zplug is installed
  if [[ ! -d ~/.config/zplug ]]; then
    git clone --depth 1 https://github.com/zplug/zplug $ZPLUG_HOME
  fi
fi
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

zplug "tymm/zsh-directory-history", use: z.sh
