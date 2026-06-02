#!/bin/bash
clear
echo "🎮 GPU Info"
echo "==========="

echo ""
echo "📋 Обнаруженное оборудование:"
echo "------------------------------"
lspci | grep -iE 'vga|3d|display'

echo ""
echo "📊 Драйверы:"
echo "-------------"
if lspci | grep -qi nvidia; then
    echo "🟢 NVIDIA обнаружена"
    nvidia-smi 2>/dev/null || echo "⚠️ nvidia-smi недоступен"
    echo ""
    echo "📦 Установленные пакеты:"
    pacman -Qs nvidia 2>/dev/null | head -10
elif lspci | grep -qi amd; then
    echo "🔴 AMD обнаружена"
    echo "📦 Установленные пакеты:"
    pacman -Qs xf86-video-amdgpu 2>/dev/null
    pacman -Qs mesa 2>/dev/null | head -5
elif lspci | grep -qi intel; then
    echo "🔵 Intel обнаружен"
    echo "📦 Установленные пакеты:"
    pacman -Qs xf86-video-intel 2>/dev/null
    pacman -Qs mesa 2>/dev/null | head -5
fi

echo ""
echo "🖥️ OpenGL:"
echo "-----------"
glxinfo 2>/dev/null | grep -i "opengl renderer" || echo "⚠️ glxinfo недоступен (установи mesa-utils)"

echo ""
echo "🌡️ Температура GPU:"
echo "--------------------"
if command -v nvidia-smi &>/dev/null; then
    nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader 2>/dev/null && echo "°C" || echo "⚠️ Недоступно"
elif [ -f /sys/class/drm/card0/device/hwmon/hwmon*/temp1_input ]; then
    TEMP=$(cat /sys/class/drm/card0/device/hwmon/hwmon*/temp1_input 2>/dev/null)
    echo "$((TEMP / 1000))°C"
else
    echo "⚠️ Не удалось определить"
fi

echo ""
echo "📈 Использование GPU:"
echo "----------------------"
if command -v nvidia-smi &>/dev/null; then
    nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader 2>/dev/null && echo "%" || echo "⚠️ Недоступно"
else
    echo "⚠️ Доступно только для NVIDIA"
fi
    echo ""
