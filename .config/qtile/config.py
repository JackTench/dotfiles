import os
import subprocess
from collections.abc import Callable

import libqtile.resources
from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Output, Screen
from libqtile.lazy import lazy
from libqtile.backend.wayland import InputConfig

from cols import rosepine
from floating import floating_layout
from screens import screens

# Run script to handle autostart.
@hook.subscribe.startup
def autostart():
    autostart_script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([autostart_script])

# Create 6 workspaces.
groups = [Group(i) for i in "123456"]

mod = "mod1"

wl_input_rules = {
    "type:keyboard": InputConfig(kb_layout = "gb")
}

keys = [
    # Window navigation and management keybinds.
    Key([mod], "h", lazy.layout.left(), desc = "Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc = "Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc = "Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc = "Move focus up"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc = "Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc = "Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc = "Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc = "Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc = "Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc = "Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc = "Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc = "Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc = "Reset all window sizes"),

    Key([mod], "w", lazy.window.toggle_floating(), desc = "Toggle window floating"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc = "Toggle window fullscreen"),

    Key([mod], "Tab", lazy.next_layout(), desc = "Change tiling layout"),

    Key([mod], "q", lazy.window.kill(), desc = "Close window"),

    # Launch keybinds.
    Key([mod], "Return", lazy.spawn("kitty"), desc = "Spawn terminal"),
    Key([mod], "space", lazy.spawn("rofi -show drun"), desc = "Spawn run launcher"),
    Key([mod], "c", lazy.spawn("google-chrome-stable"), desc = "Spawn web browser"),
    Key([mod], "b", lazy.spawn("thunar"), desc = "Spawn file manager"),
    Key([mod], "v", lazy.spawn("pavucontrol -t 3"), desc = "Spawn volume control"),

    # System keybinds.
    Key([mod, "control"], "r", lazy.reload_config(), desc = "Reload qtile config"),
]
# Append workspace management keybinds.
for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc = "Switch workspace"),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name), desc = "Send window to workspace"),
        ]
    )
# Add mouse binds.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start = lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start = lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# Set tiling layouts.
layout_cfg = {
    "border_width": 1,
    # Set colours for borders.
    "border_focus": rosepine["rose"],
    "border_normal": rosepine["overlay"],
}
layouts = [
    # Master and stack layout from XMonad.
    layout.MonadTall(**layout_cfg),
    # Fibonacci layout.
    layout.Spiral(**layout_cfg),
    # Columns layout from XMonad.
    layout.MonadThreeCol(**layout_cfg),
    # Floating layout.
    layout.Floating(),
]

reconfigure_screens = True
