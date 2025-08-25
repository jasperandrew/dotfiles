#!/usr/bin/env bash

declare -a filepaths=()
filepaths+=('etc/sddm.conf')
filepaths+=('home/jasper/.config/eza/theme.yml')
filepaths+=('home/jasper/.config/fastfetch/config.jsonc')
filepaths+=('home/jasper/.config/fastfetch/the-ship-logo.png')
filepaths+=('home/jasper/.config/fastfetch/the-ship-logo.txt')
filepaths+=('home/jasper/.config/fish/config.fish')
filepaths+=('home/jasper/.config/hypr/')
filepaths+=('home/jasper/.config/kitty/kitty.conf')
filepaths+=('home/jasper/.config/kitty/theme-fold.conf')
filepaths+=('home/jasper/.config/logid/logid.cfg')
filepaths+=('home/jasper/.config/mako/config')
filepaths+=('home/jasper/.config/starship.toml')
filepaths+=('home/jasper/.config/tofi/config')
filepaths+=('home/jasper/.config/waybar/config.jsonc')
filepaths+=('home/jasper/.config/waybar/style.css')
filepaths+=('home/jasper/.config/yazi/keymap.toml')
filepaths+=('home/jasper/.config/yazi/yazi.toml')
filepaths+=('home/jasper/.gitconfig')
filepaths+=('home/jasper/.mozilla/firefox/s8csmeui.default-release/chrome/userChrome.css')
filepaths+=('home/jasper/pictures/wallpapers/foldward/')
filepaths+=('usr/share/sddm/scripts/Xsetup')
filepaths+=('usr/share/sddm/scripts/Xstop')
filepaths+=('usr/share/sddm/themes/bg.png')
filepaths+=('usr/share/sddm/themes/obscure/')

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_ROOT_DIR=$SCRIPT_DIR/files

help () {
   echo "usage: $0 [up|down]"
}

docopy () {
   echo Clearing $REPO_ROOT_DIR...
   rm -rf $REPO_ROOT_DIR 2> /dev/null
   mkdir $REPO_ROOT_DIR

   SRC=
   DST=$REPO_ROOT_DIR

   echo Copying from $SRC to $DST...
   for f in "${filepaths[@]}"; do
      echo $SRC/$f "-->" $DST/$f
      mkdir -p $DST/$(dirname $f);
      rm $DST/$f 2> /dev/null
      cp -r $SRC/$f $DST/$f
   done
}

docopy