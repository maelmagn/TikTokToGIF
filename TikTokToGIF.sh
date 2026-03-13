#!/bin/bash

URL="$1"
OUTPUT="$2"
START="${3:-00:00:00}"
END="$4"

if [[ -z "$URL" || -z "$OUTPUT" ]]; then
    echo "Usage: $0 <URL> <SORTIE.gif> [DÉBUT] [FIN]"
    exit 1
fi

TMP_IN="raw_$(date +%s).mp4"
TMP_CUT="cut_$(date +%s).mp4"

cleanup() { rm -f "$TMP_IN" "$TMP_CUT"; }
trap cleanup EXIT

# DL TikTok
yt-dlp "$URL" -o "$TMP_IN" --quiet --no-warnings

if [[ -n "$END" ]]; then
    ffmpeg -ss "$START" -to "$END" -i "$TMP_IN" -c:v libx264 -crf 18 -preset superfast -y -loglevel error "$TMP_CUT"
else
    ffmpeg -ss "$START" -i "$TMP_IN" -c:v libx264 -crf 18 -preset superfast -y -loglevel error "$TMP_CUT"
fi

# Compress
gifski -o "$OUTPUT" "$TMP_CUT" --width 600 --fps 20 --quality 80 --repeat 0
echo "Gif export : $OUTPUT"
