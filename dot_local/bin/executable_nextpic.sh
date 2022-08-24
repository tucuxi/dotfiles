#!/bin/bash

image_source="bing"
image_directory="${XDG_DATA_HOME-$HOME/.local/share}/backgrounds"
next_image="${image_directory}/_nextpic.jpg"
current_image="${image_directory}/_pic.jpg"

cycle_image() {
	if [ -s "$next_image" ]; then
		cp "$next_image" "$current_image" 
	fi
}

load_next_image() {
	local image
  image=$(mktemp)
	
	for delay in 0 1 1 1 2 5; do
	  case "$image_source" in
			bing)
				local host_path
				host_path="$(curl -s 'http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1' | jq -r '.images[].url')"
				curl -fsL "https://bing.com$host_path" -o "$image"
				;;
			unsplash)
				curl -fsL "https://source.unsplash.com/random/1920x1080?nature" -o "$image"
				;;
		esac
	  if [ "$?" -eq 0 ] && [ -s "$image" ]; then
				cp "$image" "$next_image"
				return 0
		fi
		sleep $delay
	done
	return 1
}

# Ensure that there is an image initially.
if [ ! -s "$next_image" ]; then
	load_next_image
fi
cycle_image
load_next_image
if [ -s "$current_image" ]; then
	echo "$current_image"
else
	exit 1
fi