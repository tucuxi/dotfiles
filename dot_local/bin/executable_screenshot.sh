#!/bin/sh

output_dir=$HOME/Screenshots

while getopts "cqs" opt; do
	case "$opt" in
		c)
			clipboard=1
			;;
		q)
			quiet=1
			;;
		s)
			selection=1
			;;
	esac
done

if [ -n "$clipboard" ]; then
	if [ -n "$selection" ]; then
		maim -q -u -b 2 -s | xclip -selection clipboard -t image/png
	else
		maim -q -u | xclip -selection clipboard -t image/png
	fi
	[ -n "$quiet" ] || notify-send -u LOW "Screenshot" "Captured to clipboard"
else
	if [ -n "$selection" ]; then
		file="$output_dir/$(date +%Y%m%d-%H%M%S-selection).png"
		maim -q -u -b 2 -s "$file"
	else
		file="$output_dir/$(date +%Y%m%d-%H%M%S-desktop).png"
		maim -q -u "$file"
	fi
	[ -n "$quiet" ] || notify-send -u LOW "Screenshot" "Captured to $file"
fi
