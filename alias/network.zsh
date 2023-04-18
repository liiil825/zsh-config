if [[ $(uname -n) == *"-opencloudos" ]]; then
    return
fi
PROXYHOST=127.0.0.1
PROXYPORT=1080

export all_proxy=socks5://$PROXYHOST:$PROXYPORT
setproxy () {
  export all_proxy=socks5://$PROXYHOST:$PROXYPORT
  # export all_proxy=socks5h://$PROXYHOST:$PROXYPORT
  # export http_proxy=http://$PROXYHOST:$PROXYPORT
  # export https_proxy=https://$PROXYHOST:$PROXYPORT
}

unsetproxy () {
  unset http_proxy
  unset https_proxy
  unset all_proxy
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

