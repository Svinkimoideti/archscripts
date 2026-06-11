clear
yay -Syu --noconfirm &>/dev/null && echo 'yay updated' || echo "yay not updated"
cd /home/arch/zapret-discord-youtube-linux/ && git pull &>/dev/null && echo 'zapret updated'
cd /home/arch/tg-ws-proxy/ && git pull &>/dev/null && echo 'proxy updated'
flatpak update &>/dev/null && echo 'flatpak updated'
echo "Updated!"
