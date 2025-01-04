#!/bin/bash

OUTPUT_FOLDER="$HOME/Pictures/screen-shots"
FILENAME="$(date +'%s_hyprshot.png')"


hyprshot -m output -o "$OUTPUT_FOLDER" -f "$FILENAME"