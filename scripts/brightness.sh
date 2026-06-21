#!/bin/sh

# 执行亮度调节
case "$1" in
    up)
        brightnessctl set +5%
        ;;
    down)
        brightnessctl set 5%-
        ;;
esac

# 获取当前亮度百分比（brightnessctl -m 输出类似: intel_backlight,backlight,400,35%,1200）
BRIGHTNESS=$(brightnessctl -m | cut -d, -f4 | tr -d '%')

# 发送带进度条的通知
notify-send -a "Brightness" -u low -h string:x-dunst-stack-tag:brightness -h int:value:"$BRIGHTNESS" "Brightness: ${BRIGHTNESS}%"
