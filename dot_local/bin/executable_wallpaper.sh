#!/bin/bash

# Requires: curl, imagemagick, jq

display_image () {
	local resolution
	resolution="$(xrandr | awk '/*/ {print $1}')"
	display -window root -resize "$resolution^" -gravity center -extent "$resolution" "$1"
}

load_image () {
	curl --silent --fail --location "$image_url" --output "$1"
}

set_image_url_bing () {
	local image_path
	image_path="$(curl -s 'http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=4' | jq -r '.images[].url' | shuf -n 1)"
	image_url="https://bing.com$image_path"
}

set_image_url_unsplash () {
	image_url="https://source.unsplash.com/random/1920x1080?nature"
}

image_directory="${XDG_DATA_HOME-$HOME/.local/share}/backgrounds"
next_image="${image_directory}/random-next.jpg"
current_image="${image_directory}/random.jpg"

[ -f "$next_image" ] && mv "$next_image" "$current_image" 
[ -f "$current_image" ] && display_image "$current_image"

sleep 2 # increase success rate if WiFi connection is still being established

temp_file=$(mktemp)
set_image_url_bing
load_image "$temp_file"
[ $? -eq 0 ] && [ -s "$temp_file" ] && mv "$temp_file" "$next_image"
