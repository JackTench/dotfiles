from libqtile import widget

from cols import rosepine

# qtile-extras' PulseVolume adds an output picker menu; fall back to core widget if not installed.
try:
    from qtile_extras.widget import PulseVolume
except ImportError:
    PulseVolume = widget.PulseVolume

def init_volume():
    volume = PulseVolume(
        font = "JetBrainsMono Nerd Font",
        fontsize = 14,
        foreground = rosepine["text"],
        padding = 10,
        # Show a volume icon instead of a percentage: muted, low, medium, high.
        emoji = True,
        emoji_list = ["\U000f075f", "\U000f057f", "\U000f0580", "\U000f057e"],
        # Style the output picker menu.
        menu_font = "JetBrainsMono Nerd Font",
        menu_fontsize = 12,
        menu_width = 640,
        menu_foreground = rosepine["text"],
        menu_foreground_disabled = rosepine["muted"],
        menu_background = rosepine["surface"],
        menu_border = rosepine["overlay"],
        menu_border_width = 1,
        highlight_colour = rosepine["highlight_med"],
    )
    # Left click opens the output picker and middle click mutes (the reverse of the defaults).
    if hasattr(volume, "select_sink"):
        volume.mouse_callbacks.update({"Button1": volume.select_sink, "Button2": volume.mute})
    return volume
