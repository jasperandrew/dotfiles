#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# contains FILELIST
source $SCRIPT_DIR/file-list.sh

DST=$SCRIPT_DIR/files

echo Clearing $DST...
rm -rf $DST 2> /dev/null
mkdir $DST

echo Copying to $DST...
for f in "${FILELIST[@]}"; do
   echo Copying $f...
   mkdir -p $DST/$(dirname $f);
   rm $DST/$f 2> /dev/null
   cp -r $SRC/$f $DST/$f
done