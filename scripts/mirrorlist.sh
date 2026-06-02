#!/bin/bash
clear
echo "🪞 Mirrorlist Updater"
echo "===================="

read -p "🔄 Обновить зеркала через reflector? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit
fi

echo ""
echo "⏳ Установка reflector..."
sudo pacman -S --noconfirm reflector 2>/dev/null

echo ""
echo "📥 Получение зеркал..."
sudo reflector \
    --latest 20 \
    --protocol https \
    --sort rate \
    --save /etc/pacman.d/mirrorlist

echo ""
echo "📋 Текущий mirrorlist:"
cat /etc/pacman.d/mirrorlist | head -10

echo ""
echo "🎉 Mirrorlist обновлён!"
echo "💡 Запусти 'sudo pacman -Syu' для обновления базы данных"
