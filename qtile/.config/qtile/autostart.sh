#!/bin/sh
feh --bg-scale /usr/share/endeavouros/backgrounds/eos_wallpapers_community/Endy_vector_EOS-planet.png
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

# Low battery notifier
#~/.config/qtile/scripts/check_battery.sh & disown

# Start welcome
#eos-welcome & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME

# Touchpad settings
xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Natural Scrolling Enabled" 1
xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1

# Hide cursor
# Requires unclutter
unclutter --fork --timeout 1 --start-hidden

(sleep 5s && volumeicon &)
