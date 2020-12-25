#!/bin/sh
ls ${XDG_DATA_HOME-$HOME/.local/share}/backgrounds/* 2> /dev/null | shuf -n 1 | xargs -r xwallpaper --zoom 
