#!/bin/sh
res=$(xrandr | awk '/*/ {print $1}')
file="$(ls ${XDG_DATA_HOME-$HOME/.local/share}/backgrounds/* 2> /dev/null | shuf -n 1)"
[ -n "$file" ] && display -window root -resize $res\^ -gravity center -extent $res "$file"
