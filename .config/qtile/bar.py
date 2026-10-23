from libqtile import bar, widget

from cols import rosepine

def init_widgets():
    widgets_list = [
        # Workspace switcher.
        widget.GroupBox(
            font = "JetBrainsMono Nerd Font",
            fontsize = 14,
            foreground = rosepine["muted"],
            active = rosepine["text"],
            inactive = rosepine["muted"],
            highlight_method = "text",
            this_current_screen_border = rosepine["iris"],
            this_screen_border = rosepine["foam"],
            other_current_screen_border = rosepine["rose"],
            other_screen_border = rosepine["muted"],
            disable_drag = True,
            padding = 8,
        ),

        # Layout icon.
        widget.CurrentLayout(
            mode = "icon",
            foreground = rosepine["rose"],
            padding = 10,
        ),

        # Current focused window title.
        widget.WindowName(
            font = "JetBrainsMono Nerd Font",
            fontsize = 14,
            foreground = rosepine["subtle"],
            padding = 10,
            max_chars = 80,
        ),

        # Spacer to right.
        widget.Spacer(length = bar.STRETCH),

        # Clock.
        widget.Clock(
            font = "JetBrainsMono Nerd Font",
            fontsize = 14,
            foreground = rosepine["text"],
            padding = 10,
        ),

        # Systray.
        widget.StatusNotifier(
            padding = 6,
            icon_size = 16,
        ),
    ]
    return widgets_list

def create_bottom_screen_bar():
    bottom_bar = bar.Bar(
        init_widgets(),
        24,
    )
    return bottom_bar

def create_top_screen_bar():
    list = init_widgets()
    list_len = len(list)
    list.pop(list_len - 1)
    top_bar = bar.Bar(
        list,
        24,
    )
    return top_bar
