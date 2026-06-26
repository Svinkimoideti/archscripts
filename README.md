# 📁 Arch Scripts

> 🐧 Набор утилит для Arch Linux

---

## 📜 Скрипты

| 🔧 Скрипт | 📝 Описание |
|-----------|-------------|
| 🧹 `clear.sh` | Очистка системы от мусора |
| 🔄 `update.sh` | Обновление системы и репозиториев |
| ⚙️ `services.sh` | Управление systemd сервисами |

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

## 📂 Структура

```
archscripts/
├── 📜 README.md
└── 📁 scripts/
    ├── 🧹 clear.sh
    ├── 🔄 update.sh
    └── ⚙️ services.sh
```

---

> 💡 **Совет:** Добавь скрипты в `~/.local/bin` для глобального доступа!
