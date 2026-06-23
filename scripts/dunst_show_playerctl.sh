#!/bin/sh

title=$(playerctl metadata title 2>/dev/null)
[ "$title" != "" ] || exit 0

artist=$(playerctl metadata artist 2>/dev/null)
album=$(playerctl metadata album 2>/dev/null)
status=$(playerctl status 2>/dev/null)
cover=$(playerctl metadata mpris:artUrl 2>/dev/null)

case "$status" in
    Playing) s='▶' ;;
    Paused)  s='⏸' ;;
    *)       s='■' ;;
esac

if [ "${cover#file://}" != "$cover" ] && [ -f "${cover#file://}" ]; then
    set -- -i "${cover#file://}"
else
    set --
fi

body="${artist:-Unknown Artist}"
if [ "$album" != "" ]; then
    body="${body}
${album}"
fi
body="${body}

${s} ${status:-Stopped}"

dunstify -r 9999 -u low "$@" "$title" "$body"
