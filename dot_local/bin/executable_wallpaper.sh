#!/bin/bash

# Requires: curl, imagemagick, jq, xrandr

image_directory="${XDG_DATA_HOME-$HOME/.local/share}/backgrounds"
next_image="${image_directory}/random-next.jpg"
current_image="${image_directory}/random.jpg"

cycle_image () {
	if [ -s "$next_image" ]; then
		cp "$next_image" "$current_image" 
	fi
}

display_image () {
	if [ -s "$current_image" ]; then
		local resolution
		resolution="$(xrandr | awk '/*/ {print $1}')"
		display -window root -resize "$resolution^" -gravity center -extent "$resolution" "$current_image"
	fi
}

preload_next_image () {
	local image

	case "$1" in
		bing)
			sleep 2 # if establishing network connection is slow, else remove this line
			local host_path
			host_path="$(curl -s 'http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1' | jq -r '.images[].url')"
			image=$(mktemp)
			curl -fsL "https://bing.com$host_path" -o "$image"
			;;
		unsplash)
			sleep 2 # if establishing network connection is slow, else remove this line
			image=$(mktemp)
			curl -fsL "https://source.unsplash.com/random/1920x1080?nature" -o "$image"
			;;
		*)
			image="$(find "$image_directory" -type f \( -name '*.jpg' -o -name '*.jpeg' \) | shuf -n 1)"
			;;
	esac
	
	if [ -n "$image" ] && [ -s "$image" ]; then
		cp "$image" "$next_image"
	fi
}

cycle_image
display_image
preload_next_image bing
