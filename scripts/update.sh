#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
RESET='\e[0m'

draw_bar() {
    local current=$1
    local total=$2
    local color=$3
    local width=25
    local filled=$((current * width / total))
    local empty=$((width - filled))
    local pct=$((current * 100 / total))
    printf "\r${color}[$(printf '█%.0s' $(seq 1 $filled) 2>/dev/null)$(printf '░%.0s' $(seq 1 $empty) 2>/dev/null)]${RESET} %3d%%" $pct
}

errors=0

read -p "update? [Y/n] " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]; then
  exit
else
  total=4
  current=0

  draw_bar 0 $total $GREEN
  yay -Syu --noconfirm &>/dev/null || errors=$((errors + 1))

  draw_bar 1 $total $GREEN
  cd /home/arch/zapret-discord-youtube-linux/ && git pull &>/dev/null || errors=$((errors + 1))

  draw_bar 2 $total $GREEN
  cd /home/arch/tg-ws-proxy/ && git pull &>/dev/null || errors=$((errors + 1))

  draw_bar 3 $total $GREEN
  flatpak update &>/dev/null || errors=$((errors + 1))

  if [ $errors -gt 0 ]; then
    draw_bar 4 $total $RED
  else
    draw_bar 4 $total $GREEN
  fi

  echo ""
  if [ $errors -gt 0 ]; then
    echo -e "${RED}Updated with $errors error(s)${RESET}"
  else
    echo -e "${GREEN}Updated!${RESET}"
  fi
fi
