#!/usr/bin/env bash

declare -a filepaths=()
filepaths+=('.config/eza/theme.yml')
filepaths+=('.config/fastfetch/config.jsonc')
filepaths+=('.config/fastfetch/the-ship-logo.txt')
filepaths+=('.config/fish/config.fish')
filepaths+=('.config/hypr/hyprland.conf')
filepaths+=('.config/hypr/hyprpaper.conf')
filepaths+=('.config/kitty/kitty.conf')
filepaths+=('.config/kitty/theme-fold.conf')
filepaths+=('.config/logid/logid.cfg')
filepaths+=('.config/mako/config')
filepaths+=('.config/starship.toml')
filepaths+=('.config/tofi/config')
filepaths+=('.config/waybar/config.jsonc')
filepaths+=('.config/waybar/style.css')
filepaths+=('.config/yazi/keymap.toml')
filepaths+=('.config/yazi/yazi.toml')
filepaths+=('.gitconfig')
filepaths+=('.mozilla/firefox/s8csmeui.default-release/chrome/userChrome.css')

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo Clearing old files...
rm -r $SCRIPT_DIR/files/* 2> /dev/null

echo Copying from $HOME...
for f in "${filepaths[@]}"; do
   echo $HOME/$f "-->" $SCRIPT_DIR/files/$f
   mkdir -p $SCRIPT_DIR/files/$(dirname $f);
   cp $HOME/$f $SCRIPT_DIR/files/$f
done