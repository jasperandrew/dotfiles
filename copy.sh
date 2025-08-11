#!/usr/bin/env bash

filepaths[0]='.config/fish/config.fish'
filepaths[1]='.config/kitty/kitty.conf'
filepaths[2]='.config/starship.toml'
filepaths[3]='.config/hypr/hyprland.conf'
filepaths[4]='.config/hypr/hyprpaper.conf'
filepaths[5]='.config/waybar/config.jsonc'
filepaths[6]='.config/waybar/style.css'
filepaths[7]='.config/tofi/config'
filepaths[8]='.config/yazi/yazi.toml'
filepaths[9]='.mozilla/firefox/s8csmeui.default-release/chrome/userChrome.css'
filepaths[10]='.gitconfig'

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo Clearing old files...
rm -r $SCRIPT_DIR/files/* 2> /dev/null

echo Copying from $HOME...
for f in "${filepaths[@]}"; do
   echo $HOME/$f "-->" $SCRIPT_DIR/files/$f
   mkdir -p $SCRIPT_DIR/files/$(dirname $f);
   cp $HOME/$f $SCRIPT_DIR/files/$f
done