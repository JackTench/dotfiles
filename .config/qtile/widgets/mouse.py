from openrazer.client import DeviceManager  # type: ignore[import-untyped]

from libqtile.log_utils import logger
from libqtile.widget import base

class MouseBattery(base.BackgroundPoll):
    """Shows the battery level of a wireless mouse through OpenRazer."""

    defaults = [
        ("update_interval", 60, "Seconds between battery checks."),
        ("device_name", None, "Part of the mouse's name to match, e.g. 'DeathAdder'. None picks the first mouse with a battery."),
        ("format", "{icon} {percent}%", "Text format. Fields: {icon}, {percent}, {name}."),
        ("icons", ["\U000f008e", "\U000f007b", "\U000f007e", "\U000f0081", "\U000f0079"], "Battery icons from empty to full."),
        ("charging_icon", "\U000f0084", "Icon shown while the mouse is charging."),
        ("low_percent", 20, "At or below this percentage, the text uses low_foreground."),
        ("low_foreground", "#eb6f92", "Text colour when the battery is low."),
        ("no_device_text", "", "Text shown when no mouse is found (asleep, off, or daemon down)."),
    ]

    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(MouseBattery.defaults)
        # Remember the normal colour so we can switch back after a low battery warning.
        self.normal_foreground = self.foreground
        self.low = False

    def _configure(self, qtile, bar):
        super()._configure(qtile,bar)
        # Left click re-checks the battery straight away.
        self.add_callbacks(
            {"Button1": self.force_update}
        )
    
    def find_mouse(self, devices):
        for device in devices:
            if device.type != "mouse" or not device.has("battery"):
                continue
            if self.device_name is None or self.device_name.lower() in device.name.lower():
                return device
        return None

    def poll(self):
        # Runs in a worker thread.
        try:
            mouse = self.find_mouse(DeviceManager().devices)
        except Exception:
            logger.exception("MouseBattery: could not reach the OpenRazer daemon")
            mouse = None

        if mouse is None:
            self.low = False
            return self.no_device_text

        percent = int(mouse.battery_level)
        charging = mouse.is_charging
        self.low = percent <= self.low_percent and not charging

        if charging:
            icon = self.charging_icon
        else:
            icon = self.icons[round(percent / 100 * (len(self.icons) - 1))]

        return self.format.format(icon = icon, percent = percent, name = mouse.name)

    def update(self, text):
        colour = self.low_foreground if self.low else self.normal_foreground
        if self.can_draw() and self.layout.colour != colour:
            self.set_font(foreground = colour)
        super().update(text)
