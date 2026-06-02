#!/bin/bash
clear
echo "💿 Disk Usage Overview"
echo "======================"

echo ""
echo "📊 Общее использование дисков:"
echo "-------------------------------"
df -h --total | grep -E '^/dev|total'

echo ""
echo "📁 Занятость домашней директории:"
echo "-----------------------------------"
du -sh "$HOME"/* 2>/dev/null | sort -rh | head -15

echo ""
echo "🗑️ Занятость /tmp:"
echo "-------------------"
du -sh /tmp/* 2>/dev/null | sort -rh | head -10

echo ""
echo "📦 Занятость кэша пакетов:"
echo "---------------------------"
du -sh /var/cache/pacman/pkg 2>/dev/null
du -sh ~/.cache/yay 2>/dev/null

echo ""
echo "💾 Инфо о разделах:"
echo "--------------------"
lsblk -f 2>/dev/null

echo ""
echo "🔧 Занятость по папкам в /home/arch:"
echo "-------------------------------------"
du -sh /home/arch/* 2>/dev/null | sort -rh | head -10
