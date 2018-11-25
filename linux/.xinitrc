#!/bin/sh

userresources=$HOME/.Xresources
[[ -f "$userresources" ]] && xrdb -merge "$userresources"

exec i3
