#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILENAME="screenshot_$(date +%Y%m%d_%H%M%S).png"

show_menu() {
    echo "📸 Screenshot Tool"
    echo "=================="
    echo ""
    echo "1) 🖼️  Весь экран"
    echo "2) 🎯 Выбор области"
    echo "3) 🪟 Активное окно"
    echo "4) ⏱️  Задержка 3 сек"
    echo "0) 🚪 Выход"
    echo ""
}

full_screen() {
    if command -v grim &>/dev/null; then
        grim "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
    elif command -v scrot &>/dev/null; then
        scrot "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
    elif command -v maim &>/dev/null; then
        maim "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
    else
        echo "❌ Установи grim, scrot или maim"
    fi
}

select_area() {
    if command -v grim &>/dev/null && command -v slurp &>/dev/null; then
        grim -g "$(slurp)" "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
    elif command -v scrot &>/dev/null; then
        scrot -s "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
    elif command -v maim &>/dev/null; then
        maim -s "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
    else
        echo "❌ Установи grim+slurp, scrot или maim"
    fi
}

active_window() {
    if command -v grim &>/dev/null; then
        WINDOW_ID=$(xdotool getactivewindow 2>/dev/null)
        if [[ -n "$WINDOW_ID" ]]; then
            GEOM=$(xdotool getwindowgeometry "$WINDOW_ID" 2>/dev/null | grep -oP '\d+x\d+\+\d+\+\d+')
            grim -g "$GEOM" "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
        fi
    elif command -v scrot &>/dev/null; then
        scrot -u "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
    elif command -v maim &>/dev/null; then
        maim -i "$(xdotool getactivewindow)" "$DIR/$FILENAME" && echo "✅ Сохранено: $DIR/$FILENAME"
    else
        echo "❌ Установи grim, scrot или maim"
    fi
}

delayed() {
    echo "⏳ Скриншот через 3 секунды..."
    sleep 3
    full_screen
}

while true; do
    show_menu
    read -p "Выбери действие: " CHOICE
    case $CHOICE in
        1) full_screen; sleep 1 ;;
        2) select_area; sleep 1 ;;
        3) active_window; sleep 1 ;;
        4) delayed; sleep 1 ;;
        0) echo "👋 Пока!"; exit 0 ;;
        *) echo "❌ Неверный выбор"; sleep 1 ;;
    esac
done
