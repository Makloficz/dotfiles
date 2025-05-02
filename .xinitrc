#!/bin/sh
#statusbar
RND=$(openssl rand -hex 8)
while xsetroot -name "$(echo "$RND  $(date +"%F %T %s")  $HOSTNAME ")";do
    if (( $(date +%s) % 60 == 0 )); then
        RND=$(openssl rand -hex 8)
    fi
    sleep 1s
done &

sleep 1
xset -b
unclutter --timeout 1 --jitter 1 --ignore-scrolling --fork --start-hidden
xbindkeys
setxkbmap -option caps:escape
xrandr --output DP-4 --mode 3440x1440 --rate 180
exec dwm
