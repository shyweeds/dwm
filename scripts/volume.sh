#!/bin/sh

# 执行音量调节
case "$1" in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
esac

# 获取静音状态（返回 yes 或 no）
MUTE_STATE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# 获取当前音量数字（使用 awk 以 / 为分隔符切片，再用 tr 过滤掉空格和 %）
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F/ '{print $2}' | tr -d ' %')

# 发送通知
if [ "$MUTE_STATE" = "yes" ]; then
    notify-send -a "Volume" -u low -h string:x-dunst-stack-tag:volume "Volume: Muted"
else
    notify-send -a "Volume" -u low -h string:x-dunst-stack-tag:volume -h int:value:"$VOLUME" "Volume: ${VOLUME}%"
fi
