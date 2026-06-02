#!/bin/bash
clear
echo "📦 Arch Linux Package Installer"
echo "================================"

PACKAGES=(
    # 🌐 Браузеры
    # firefox
    # chromium

    # 💬 Мессенджеры
    # discord
    # telegram-desktop

    # 🎵 Мультимедиа
    # mpv
    # vlc
    # pavucontrol

    # 🛠️ Разработка
    # git
    # base-devel
    # neovim
    # visual-studio-code-bin

    # 🎨 GUI
    # gnome
    # gnome-tweaks

    # 📁 Файловые менеджеры
    # thunar
    # ranger

    # 🔧 Утилиты
    # htop
    # btop
    # neofetch
    # unzip
    # wget
    # curl
    # firefox
)

echo ""
echo "📋 Будут установлены пакеты:"
for pkg in "${PACKAGES[@]}"; do
    [[ -n "$pkg" ]] && echo "  • $pkg"
done
echo ""

read -p "🚀 Начать установку? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit
fi

for pkg in "${PACKAGES[@]}"; do
    [[ -z "$pkg" ]] && continue
    if ! pacman -Qi "$pkg" &>/dev/null && ! yay -Qi "$pkg" &>/dev/null; then
        echo "⏳ Устанавливаю $pkg..."
        yay -S --noconfirm "$pkg" 2>/dev/null || sudo pacman -S --noconfirm "$pkg"
    else
        echo "✅ $pkg уже установлен"
    fi
done

echo ""
echo "🎉 Установка завершена!"
