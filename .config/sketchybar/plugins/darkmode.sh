#!/bin/sh

source $HOME/.config/sketchybar/icons.sh

CONFIG="$HOME/.config/alacritty/themes/active.toml"
THEME_DIR="$HOME/.config/alacritty/themes"
LIGHT_THEME="$THEME_DIR/ayu_light.toml"
DARK_THEME="$THEME_DIR/ayu_dark.toml"

if [[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == "Dark" ]]
then
    sketchybar -m --set appearance icon="$MOON_ICN"
    cp $DARK_THEME $CONFIG

else
    sketchybar -m --set appearance icon="$SUN_ICN"
    cp $LIGHT_THEME $CONFIG
fi
