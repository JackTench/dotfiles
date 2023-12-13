#!/bin/sh

# Jack Tench 2022
# qtile config
# autostart.sh

# Set screen(s).
xrandr --output HDMI-0 --mode 1920x1080 --pos 320x0 --rotate normal --output DP-0 --primary --mode 2560x1080 --pos 0x1080 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off

# Set keyboard layout
setxkbmap gb

# Load GNOME keyring tool.
dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets

# Run compositor.
picom -b &

# Set wallpaper
nitrogen --restore &
