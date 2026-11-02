import re

from libqtile import layout
from libqtile.config import Match

# Configure some windows to always float.
float_rules = [
    *layout.Floating.default_float_rules,
    # Git dialogs (gitk).
    Match(wm_class = "confirmreset"),
    Match(wm_class = "makebranch"),
    Match(wm_class = "maketag"),
    Match(title = "branchdialog"),
    # Password prompts.
    Match(wm_class = "ssh-askpass"),
    Match(title = "pinentry"),
    # Volume control.
    Match(wm_class = "org.pulseaudio.pavucontrol"),
    # Prism Launcher's download/progress dialog.
    Match(wm_class = "org.prismlauncher.PrismLauncher", title = re.compile(r"^Please wait\.\.\.")),
    # Minecraft itself; the class includes the game version, e.g. "Minecraft* 1.21.1".
    Match(wm_class = re.compile(r"^Minecraft")),
    # Steam's friends list.
    Match(wm_class = "steam", title = "Friends List"),
    # Thunar's dialogs (Properties, file operation progress, etc.), but not its main windows.
    Match(wm_class = "thunar", title = re.compile(r"^(?!.* - Thunar$)")),
    # LibreSplit.
    Match(wm_class = "org.libresplit.LibreSplit"),
]
