from libqtile.config import Screen

from bar import create_bottom_screen_bar, create_top_screen_bar

screens = [
    # HDMI-A-1 - upper 1920x1080 monitor
    Screen(
        x = 320,
        y = -1080,
        width = 1920,
        height = 1080,
        bottom = create_top_screen_bar(),
    ),

    # DP-2 - lower 2560x1080 ultrawide
    Screen(
        x = 0,
        y = 0,
        width = 2560,
        height = 1080,
        bottom = create_bottom_screen_bar(),
    ),
]
