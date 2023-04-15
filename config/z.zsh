if [[ $(user) == "Darwin" ]]; then
  export ZPLUG_HOME=/usr/local/opt/zplug
elif [[ $(user) == "Linux" ]]; then
  export ZPLUG_HOME=~/.config/zplugin/
fi
source $ZPLUG_HOME/init.zsh

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
