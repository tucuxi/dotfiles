#!/bin/bash

# Adapted from https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a
#
# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
	pamixer --get-volume
}

function is_mute {
	pamixer --get-mute > /dev/null
}

function send_notification {
	volume=`get_volume`
	# Make the bar with the special character ─ (it's not dash -)
	# https://en.wikipedia.org/wiki/Box-drawing_character
	bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')
	# Send the notification
	dunstify -i audio-volume-medium -r 2593 -u normal "    $bar"
}

case $1 in
    up)
	# Set the volume on (if it was muted)
	pamixer --unmute
	# Up the volume (+ 5%)
	pamixer --increase 5
	send_notification
	;;
    down)
	pamixer --unmute
	pamixer --decrease 5
	send_notification
	;;
    mute)
    	# Toggle mute
	if is_mute ; then
		pamixer --unmute
		send_notification
	else
		pamixer --mute
		dunstify -i audio-volume-muted -r 2593 -u normal "Mute"
	fi
	;;
esac

