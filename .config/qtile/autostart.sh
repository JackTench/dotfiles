#!/bin/sh

# Pass Wayland session env to systemd/D-Bus so xdg-desktop-portal-wlr can start (screen sharing).
export XDG_CURRENT_DESKTOP=qtile
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

wlr-randr \
    --output DP-2 \
    --mode 2560x1080@74.991 \
    --pos 0,0 \
    --output HDMI-A-1 \
    --mode 1920x1080 \
    --pos 320,-1080

# Set wallpaper.
swaybg -i ~/Wallpapers/block-wave-moon.png &
