clear
read -p "Do you want to clear your system? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
  exit
else
  for i in "." ".." "..."; do echo -ne "\rStart cleaning $i "; sleep 0.1; done; echo
  sudo journalctl --vacuum-time=2d &>/dev/null
  if [ -d "/tmp" ]; then
    sudo rm -rf /tmp/*
  fi
  sudo pacman -Rns $(pacman -Qdtq) --noconfirm &>/dev/null
  yay -Scc --noconfirm &>/dev/null
fi
clear && echo "Cleaning done!"
