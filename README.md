# 📁 Arch Scripts

> 🐧 Набор утилит для Arch Linux

---

## 📜 Скрипты

| 🔧 Скрипт | 📝 Описание |
|-----------|-------------|
| 🧹 `clear.sh` | Очистка системы от мусора |
| 🔄 `update.sh` | Обновление системы и репозиториев |
| 📦 `install.sh` | Автоматическая установка пакетов |
| 💾 `backup.sh` | Бэкап конфигов и dotfiles |
| 🪞 `mirrorlist.sh` | Обновление зеркал pacman |
| 📰 `news.sh` | Проверка Arch Linux новостей |
| ⚙️ `services.sh` | Управление systemd сервисами |
| 💿 `disk.sh` | Обзор использования диска |
| 📸 `screenshot.sh` | Быстрые скриншоты |
| 🎮 `gpu.sh` | Инфо о GPU и драйверах |

---

## 🚀 Быстрый старт

```bash
# 📥 Клонируй репозиторий
git clone https://github.com/Svinkimoideti/archscripts.git ~/archscripts

# 🔑 Сделай скрипты исполняемыми
chmod +x ~/archscripts/scripts/*.sh

# 🔗 Добавь в PATH (опционально)
echo 'export PATH="$PATH:$HOME/archscripts/scripts"' >> ~/.zshrc
```

---

## 📦 Зависимости

```bash
# 🪞 Для mirrorlist.sh
sudo pacman -S reflector

# 📸 Для screenshot.sh
sudo pacman -S grim slurp   # Wayland
# или
sudo pacman -S scrot         # X11
# или
sudo pacman -S maim          # X11

# 🎮 Для gpu.sh
sudo pacman -S mesa-utils
```

---

## 📂 Структура

```
archscripts/
├── 📜 README.md
└── 📁 scripts/
    ├── 🧹 clear.sh
    ├── 🔄 update.sh
    ├── 📦 install.sh
    ├── 💾 backup.sh
    ├── 🪞 mirrorlist.sh
    ├── 📰 news.sh
    ├── ⚙️ services.sh
    ├── 💿 disk.sh
    ├── 📸 screenshot.sh
    └── 🎮 gpu.sh
```

---

> 💡 **Совет:** Добавь скрипты в `~/.local/bin` для глобального доступа!
