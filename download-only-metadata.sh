#!/bin/zsh
yt-dlp --skip-download --write-info-json --write-description --download-archive metadata-archive.txt $1
