export all_proxy=socks5://127.0.0.1:1086
setproxy () {
  export all_proxy=socks5://127.0.0.1:1086
  export https_proxy=http://127.0.0.1:1087
  export http_proxy=http://127.0.0.1:1087
}

unsetproxy () {
  unset all_proxy
  unset http_proxy
  unset https_proxy
}

mylocalip () {
  mylocalip="$(ifconfig | grep 'inet.*netmask.*broadcast')"
  lanip="$(echo $myip | awk '{print $2}')"
  publicip="$(echo $myip | awk '{print $6}')"
  echo '你的局域网IP是: '$lanip
  echo '你的外网IP是: '$publicip
  echo '你的局域网IP是' $lanip | pbcopy
}

alias myip='curl http://wtfismyip.com/json'

