#!/bin/sh
resolution=$(xrandr | awk '/*/ {print $1}')

nextfile=${XDG_DATA_HOME-$HOME/.local/share}/backgrounds/random-next.jpg
currfile=${XDG_DATA_HOME-$HOME/.local/share}/backgrounds/random.jpg

[ -f "$nextfile" ] && mv "$nextfile" "$currfile" 
[ -f "$currfile" ] && display -window root -resize $resolution\^ -gravity center -extent $resolution "$currfile"

sleep 1

tempfile=$(mktemp)
wget -q "https://source.unsplash.com/random/1920x1080?nature" -O "$tempfile" 2> /dev/null
[ $? -eq 0 -a -s "$tempfile" ] && mv "$tempfile" "$nextfile"
