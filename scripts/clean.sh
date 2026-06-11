read -p "Start clean? [Y/n] " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]; then
  exit
else
  for i in "." ".." "..."; do echo -ne "\rStart cleaning $i "; sleep 0.1; done;
  echo ""
  sudo journalctl --vacuum-time=2d &>/dev/null && echo "journalctl cleaned" || echo "journal error"
  sudo rm -rf /tmp/* && echo "tmp cleaned" || echo "tmp cleaningerror"
  yay -Scc --noconfirm &>/dev/null && echo "yay packages cleaned" || echo "yay -Scc -> error"
  rm -rf ~/.zsh_history && touch ~/.zsh_history && echo "zsh history cleaned" || echo "zsh cleaning error"
fi
echo
echo "Cleaning done!"
