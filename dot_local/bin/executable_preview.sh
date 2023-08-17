#!/usr/bin/env bash

case "${1,,}" in
    *.png|*.jpg|*.jpeg|*.webp) mediainfo "$1";;
    *.mkv|*.mp4|*.mp3) mediainfo "$1";;
    *.md) glow -s dark "$1";;
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *) bat -pp --color always --line-range 1:"$3" "$1" ;;
esac
