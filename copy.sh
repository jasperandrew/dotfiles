#!/usr/bin/env bash

declare -a filepaths=()
filepaths+=('.config/eza/theme.yml')
filepaths+=('.config/fastfetch/config.jsonc')
filepaths+=('.config/fastfetch/the-ship-logo.txt')
filepaths+=('.config/fastfetch/the-ship-logo.png')
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

help () {
   echo "help"
}

docopy () {
   # echo Clearing old files...
   # rm -r $SCRIPT_DIR/files/* 2> /dev/null

   echo Copying from $SRC to $DST...
   for f in "${filepaths[@]}"; do
      echo $SRC/$f "-->" $DST/$f
      mkdir -p $DST/$(dirname $f);
      rm $DST/$f 2> /dev/null
      cp $SRC/$f $DST/$f
   done
}

up () {
   SRC=$HOME
   DST=$SCRIPT_DIR/files
   docopy
}

down () {
   SRC=$SCRIPT_DIR/files
   DST=$HOME
   docopy
}

if [[ $# -eq 0 ]]; then echo "[Error] Argument required"; help
elif [[ $# -eq 1 ]]; then

	if [[ $1 == "up" ]]; then up
	elif [[ $1 == "down" ]]; then down
	else echo "[Error] Invalid argument"; help
	fi

else echo "[Error] Too many arguments"; help
fi