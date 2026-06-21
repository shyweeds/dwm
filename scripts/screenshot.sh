#!/bin/sh
DIR="$HOME/Pictures"
mkdir -p "$DIR" && scrot "$DIR/%m-%d-%Y-%H%M%S.png"
notify-send "screenshot-fullscreen
ok!"
