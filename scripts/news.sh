#!/bin/bash
clear
echo "📰 Arch Linux News Checker"
echo "========================="

NEWS_URL="https://archlinux.org/news/"

echo ""
echo "⏳ Загрузка новостей..."
NEWS=$(curl -s "$NEWS_URL" | grep -oP '<h2[^>]*>.*?</h2>' | sed 's/<[^>]*>//g' | head -10)

if [ -z "$NEWS" ]; then
    echo "⚠️ Не удалось загрузить новости"
    exit 1
fi

echo ""
echo "📋 Последние новости:"
echo "----------------------"
NEWS_INDEX=1
while IFS= read -r line; do
    [[ -n "$line" ]] && echo "  $NEWS_INDEX. $line" && ((NEWS_INDEX++))
done <<< "$NEWS"

echo ""
echo "----------------------"
read -p "🌐 Открыть сайт новостей? [Y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    xdg-open "$NEWS_URL" 2>/dev/null &
fi
