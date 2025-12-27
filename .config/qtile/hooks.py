from libqtile import hook
from libqtile.config import Match

# Ensure Eclipse (Java IDE) pop-up windows are floating instead of tiled.
# The wm_class is the same across all Eclipse windows.
@hook.subscribe.client_new
def float_eclipse_popups(client):
    if client.match(Match(wm_class="Eclipse")):
        if client.window.get_wm_transient_for():
            client.floating = True
            client.center()
