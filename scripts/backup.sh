#!/bin/bash
clear
echo "💾 Backup Dotfiles & Configs"
echo "============================"

BACKUP_DIR="$HOME/backup/$(date +%Y%m%d_%H%M%S)"
DOTFILES_DIR="$HOME/dotfiles-backup"

mkdir -p "$BACKUP_DIR"

FILES=(
    ".bashrc"
    ".zshrc"
    ".profile"
    ".xinitrc"
    ".vimrc"
    ".tmux.conf"
    ".gitconfig"
    ".zsh_history"
    ".bash_history"
    ".config/nvim"
    ".config/hypr"
    ".config/waybar"
    ".config/rofi"
    ".config/dunst"
    ".config/kitty"
    ".config/alacritty"
    ".config/firefox"
    ".config/Code"
    ".config/discord"
    ".config/spotify"
    ".local/share/nvim"
    ".local/share/applications"
    "wallpapers"
    "scripts"
    "projects"
)

echo ""
echo "📂 Backup будет сохранён в: $BACKUP_DIR"
echo ""

read -p "🚀 Начать бэкап? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit
fi

for item in "${FILES[@]}"; do
    src="$HOME/$item"
    if [ -e "$src" ]; then
        dest_dir="$BACKUP_DIR/$(dirname "$item")"
        mkdir -p "$dest_dir"
        cp -r "$src" "$dest_dir/" 2>/dev/null && echo "✅ $item" || echo "❌ $item"
    else
        echo "⏭️ $item (не найден)"
    fi
done

echo ""
echo "🎉 Бэкап завершён: $BACKUP_DIR"
du -sh "$BACKUP_DIR"
