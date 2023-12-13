# Jack Tench 2023
# qtile config
# config.py

# Imports
import os
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from cols import nord

# Set mod key to alt.
mod = "mod1"

# Set apps to be quick launched.
appTerm = "alacritty"
appRun = "dmenu_run"
appText = "nvim"

# Run script to handle starting the compositor and setting the wallpaper.
@hook.subscribe.startup
def autostart():
    home=os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])

# Configure default layout options.
layoutCfg = {
    # Size of gaps around windows.
    "margin": 8,
    # Size of border around windows.
    "border_width": 2,
    # Colour of borders for focused and unfocused windows.
    "border_focus": nord["frost2"],
    "border_normal": nord["polarnight4"],
}

# Configure default widget options.
widget_defaults = dict(
    font = "JetBrainsMono Nerd Font",
    fontsize = 16,
    foreground = nord["snowstorm3"],
    padding = 4,
)
extension_defaults = widget_defaults.copy()

# Create 8 workspaces.
groups = [Group(i) for i in "12345678"]

# Define main keybinds.
keys = [

    # Navigation keybinds.
    Key([mod], "q", lazy.window.kill(), desc = "Alt + Q closes the focused window."),
    Key([mod], "Tab", lazy.next_layout(), desc = "Alt + Tab changes the tiling layout."),
    Key([mod], "h", lazy.layout.left(), desc = "Alt + H focuses the window to the left."),
    Key([mod], "l", lazy.layout.right(), desc = "Alt + L focuses the window to the right."),
    Key([mod], "j", lazy.layout.down(), desc = "Alt + J focuses the window below."),
    Key([mod], "k", lazy.layout.up(), desc = "Alt + K focuses the window above."),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc = "Alt + Shift + H moves the focused window left."),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc = "Alt + Shift + L moves the focused window right."),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc = "Alt + Shift + J moves the focused window down."),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc = "Alt + Shift + K moves the focused window up."),

    # Launch commands.
    Key([mod], "Return", lazy.spawn(appTerm), desc = "Alt + Enter opens a terminal."),
    Key([mod], "space", lazy.spawn(appRun), desc = "Alt + Space opens the run launcher."),
    
    # System commands.
    Key([mod, "control"], "r", lazy.reload_config(), desc = "Control + Alt + R reloads the current qtile config."),

]

# Define keybinds for dealing with workspaces.
for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc = "Alt + Number switches to workspace.",
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc = "Alt + Shift + Number sends window to workspace.",
            ),
        ]
    )

# Define layouts.
layouts = [
    # Master and Stack layout from XMonad.
    layout.MonadTall(**layoutCfg),
    # Fib layout.
    layout.Spiral(**layoutCfg),
    # Columns layout. I use an ultrawide, so this is useful.
    layout.MonadThreeCol(**layoutCfg),
    # Monocle layout.
    layout.Max(**layoutCfg),
]

# Configure widgets on bar.
# This seems to only work in a function? Code by dt (Derek Taylor)
def initWidgetsList():
    widgetsList = [
        
        # Workspace switcher.
        widget.GroupBox(
            highlight_method = "block",
            disable_drag = True,
            this_current_screen_border = nord["snowstorm1"],
            # TODO: Fix the colours.
        ),
        
        # Layout icon.
        widget.CurrentLayoutIcon(),

        # Current focused window.
        widget.WindowName(),

        # Spacer to right.
        widget.Spacer(length = bar.STRETCH,),

        widget.Clock(),

    ]
    return widgetsList

# Helper functions for bars on multiple monitors.
# Bottom monitor.
def initWidgetsBtm():
    widgetsListTop = initWidgetsList()
    return widgetsListBtm

# Top monitor.
def initWidgetsTop():
    widgetsListTop = initWidgetsList()
    # TODO: Filter list to remove systray.
    return widgetsListTop

# Configure monitor(s).
screens = [
    # Bottom monitor is my main.
    Screen(top=bar.Bar(widgets=initWidgetsList(), size=32, background = nord["polarnight1"], margin = 8)),
    # Top monitor is my secondary.
    Screen(top=bar.Bar(widgets=initWidgetsList(), size=32, background = nord["polarnight1"], margin = 8)),
]

# Configure floating rules and layouts.
# TODO: Clean up.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start = lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start = lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
floating_layout = layout.Floating(
        float_rules = [
            *layout.Floating.default_float_rules,
            Match(wm_class = "confirmreset"),
            Match(wm_class = "makebranch"),
            Match(wm_class = "maketag"),
            Match(wm_class = "ssh-askpass"),
            Match(title = "branchdialog"),
            Match(title = "pinentry"),
        ]
)

# Set WM name. If anything breaks (probably with java) swap these lines out.
wmname = "qtile"
#wmname = "LG3D"

# All of this is qtile default code.
# TODO: Lean what all of this does and clean up.
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
