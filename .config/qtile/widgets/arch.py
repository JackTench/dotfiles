import asyncio
import subprocess

from libqtile import widget
from libqtile.log_utils import logger
from libqtile.utils import create_task

from cols import rosepine

ICON = "\U000F08C7"

def arch_updates():
    total = 0
    # checkupdates (from pacman-contrib) fetches from Arch repos.
    # paru -Qua fetches from the AUR.
    for cmd in (["checkupdates"], ["paru", "-Qua"]):
        try:
            result = subprocess.run(cmd, capture_output = True, text = True, timeout = 120)
        except (FileNotFoundError, subprocess.TimeoutExpired):
            logger.exception("arch_updates: %s failed", cmd[0])
            continue
        total += len(result.stdout.splitlines())
    return total

def arch_updates_text():
    packages = arch_updates()
    if packages == 0:
        return f"{ICON} "
    return f"{ICON} {packages}"

def init_arch_updates():
    updates = widget.GenPollText(
        font = "JetBrainsMono Nerd Font",
        fontsize = 14,
        foreground = rosepine["text"],
        padding = 10,
        func = arch_updates_text,
        update_interval = 600,
    )

    # Run paru in a terminal.
    # Re-check once the window closes so the count updates.
    async def run_paru():
        proc = await asyncio.create_subprocess_exec("kitty", "-e", "paru")
        await proc.wait()
        updates.force_update()

    # Callbacks.
    updates.mouse_callbacks.update({
        "Button1": lambda: create_task(run_paru()),
        "Button3": updates.force_update,
    })

    return updates
