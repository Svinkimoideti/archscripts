#!/bin/bash

show_menu() {
    clear
    echo "⚙️  Systemd Service Manager"
    echo "=========================="
    echo ""
    echo "1) 📋 Показать активные сервисы"
    echo "2) 🔴 Показать неактивные сервисы"
    echo "3) ✅ Включить сервис"
    echo "4) ⏹️  Остановить сервис"
    echo "5) 🔄 Перезапустить сервис"
    echo "6) 📊 Статус сервиса"
    echo "7) 🚀 Включить автозапуск"
    echo "8) 🛑 Отключить автозапуск"
    echo "9) 🔄 Обновить systemd daemon"
    echo "0) 🚪 Выход"
    echo ""
}

active_services() {
    clear
    echo "📋 Активные сервисы:"
    echo "===================="
    systemctl list-units --type=service --state=active --no-pager
    echo ""
    read -p "Нажми Enter..."
}

inactive_services() {
    clear
    echo "🔴 Неактивные сервисы:"
    echo "======================"
    systemctl list-unit-files --type=service --state=disabled --no-pager | head -30
    echo ""
    read -p "Нажми Enter..."
}

enable_service() {
    read -p "📝 Имя сервиса: " SERVICE
    if [[ -n "$SERVICE" ]]; then
        sudo systemctl enable "$SERVICE"
        echo "✅ $SERVICE включён"
        sleep 1
    fi
}

disable_service() {
    read -p "📝 Имя сервиса: " SERVICE
    if [[ -n "$SERVICE" ]]; then
        sudo systemctl disable "$SERVICE"
        echo "🛑 $SERVICE отключён"
        sleep 1
    fi
}

start_service() {
    read -p "📝 Имя сервиса: " SERVICE
    if [[ -n "$SERVICE" ]]; then
        sudo systemctl start "$SERVICE"
        echo "▶️ $SERVICE запущен"
        sleep 1
    fi
}

stop_service() {
    read -p "📝 Имя сервиса: " SERVICE
    if [[ -n "$SERVICE" ]]; then
        sudo systemctl stop "$SERVICE"
        echo "⏹️ $SERVICE остановлен"
        sleep 1
    fi
}

restart_service() {
    read -p "📝 Имя сервиса: " SERVICE
    if [[ -n "$SERVICE" ]]; then
        sudo systemctl restart "$SERVICE"
        echo "🔄 $SERVICE перезапущен"
        sleep 1
    fi
}

status_service() {
    read -p "📝 Имя сервиса: " SERVICE
    if [[ -n "$SERVICE" ]]; then
        systemctl status "$SERVICE" --no-pager
        echo ""
        read -p "Нажми Enter..."
    fi
}

reload_daemon() {
    sudo systemctl daemon-reload
    echo "🔄 Daemon перезагружен"
    sleep 1
}

while true; do
    show_menu
    read -p "Выбери действие: " CHOICE
    case $CHOICE in
        1) active_services ;;
        2) inactive_services ;;
        3) enable_service ;;
        4) stop_service ;;
        5) restart_service ;;
        6) status_service ;;
        7) enable_service ;;
        8) disable_service ;;
        9) reload_daemon ;;
        0) clear; echo "👋 Пока!"; exit 0 ;;
        *) echo "❌ Неверный выбор"; sleep 1 ;;
    esac
done
