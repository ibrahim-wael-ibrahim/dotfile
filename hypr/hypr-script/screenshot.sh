#!/bin/bash

# Check if the mode is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <mode>"
  echo "Modes: output, region, window"
  exit 1
fi

MODE="$1"
OUTPUT_FOLDER="$HOME/Pictures/screen-shots"
FILENAME="$(date +'%s_hyprshot.png')"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_FOLDER"

# Execute hyprshot with the specified mode
case $MODE in
  output|region|window)
    hyprshot -m "$MODE" -o "$OUTPUT_FOLDER" -f "$FILENAME"
    ;;
  *)
    echo "Invalid mode: $MODE"
    echo "Modes: output, region, window"
    exit 1
    ;;
esac
