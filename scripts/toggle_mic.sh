#!/bin/sh
pactl set-source-mute @DEFAULT_SOURCE@ toggle

state=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
volume=$(pactl get-source-volume @DEFAULT_SOURCE@ \
                                          | grep -o '[0-9]\+%' \
                                          | head -n1)

if [ "$state" = yes ]; then
    dunstify "🎤 Mic Muted"
else
  dunstify "🎤 Mic On (dB:$volume)"
fi
