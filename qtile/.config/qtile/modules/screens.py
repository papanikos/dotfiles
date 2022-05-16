from libqtile import bar
from .widgets import *
from libqtile.config import Screen
import os
from .theme import colors

def remove_title(text):
    """Display only the icon in TaskList"""
    return ""

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(padding=3, linewidth=0, background=colors["dark"]),
                widget.Image(
                    filename="~/.config/qtile/eos-c.png",
                    margin=3,
                    background=colors["dark"],
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn("rofi -show combi")
                    },
                ),
                widget.Sep(padding=4, linewidth=0, background=colors["dark"]),
                widget.GroupBox(
                    highlight_method="block",
                    block_highlight_text_color=colors["dark"],
                    this_screen_border=colors["focus"],
                    this_current_screen_border=colors["focus"],
                    active=colors["active"],
                    inactive=colors["inactive"],
                    background=colors["dark"],
                ),
                widget.TextBox(text="", padding=0, fontsize=24, foreground=colors["dark"]),
                widget.Prompt(),
                widget.Spacer(length=5),
                # widget.WindowName(foreground=colors["color1"], fmt="{}"),
                widget.TaskList(parse_text=remove_title, border=colors["color2"]),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CurrentLayoutIcon(scale=0.75),
                # widget.CheckUpdates(
                #     update_interval=1800,
                #     distro="Arch_yay",
                #     display_format="{updates} Updates",
                #     foreground="#ffffff",
                #     mouse_callbacks={
                #         "Button1": lambda: qtile.cmd_spawn("alacritty -e yay -Syu")
                #     },
                #     background="#2f343f",
                # ),
                widget.TextBox(
                    background=colors["color1"],
                    text="",
                    foreground=colors["color2"],
                    padding=-2,
                    fontsize=26,
                ),
                #volume,
                widget.TextBox(
                    text="",
                    padding=-2,
                    fontsize=24,
                    foreground=colors["color1"]),
                widget.Clock(
                    fontsize=14,
                    format=" %a %d-%m-%Y %H:%M ",
                    background=colors["color1"],
                    foreground=colors["text"],
                    padding=5,
                ),
                widget.Sep(background=colors["color1"],linewidth=0, padding=0),
                widget.TextBox(
                    text="",
                    padding=-2,
                    fontsize=28,
                    foreground=colors["dark"],
                    background=colors["color1"],
                ),
                #widget.Volume(
                #    background=colors["dark"],
                #    emoji=True,
                #    padding=4,
                #    foreground=colors["light"],
                #),
                widget.KeyboardLayout(
                    configured_keyboards=["us", "gr"],
                    display_map={"us": "EN", "gr": "GR"},
                ),
                widget.Sep(background=colors["dark"],linewidth=0, padding=4),
                widget.Systray(),
                widget.Sep(background=colors["dark"],linewidth=0, padding=4),
                widget.TextBox(
                    text="",
                    fontsize=20,
                    padding=2,
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            os.path.expanduser("~/.config/rofi/powermenu.sh")
                        )
                    },
                    foreground="#e39378",
                ),
            ],
            26,  # height in px
            background=colors["dark"],  # background color
        ),
    ),
]
