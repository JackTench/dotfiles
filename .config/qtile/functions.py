from libqtile.lazy import lazy

@lazy.function
def unminimize_all(qtile):
    for win in qtile.current_group.windows:
        if win.minimized:
            # Forcing a window to tile restores it from minimize.
            # This function is intended to do both, but one works.
            win.floating = False
