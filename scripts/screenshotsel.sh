#!/bin/sh
DIR="$HOME/Pictures"
notify-send "screenshot-chosen-screen
wait for your choice!"
mkdir -p "$DIR" && scrot "$DIR/%m-%d-%Y-%H%M%S.png" --select --line mode=edge
notify-send "screenshot-chosen-screen
ok!"
