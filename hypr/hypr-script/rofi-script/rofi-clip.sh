#!/usr/bin/env bash
## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Clipboard Manager. This script uses CopyQ, rofi, and wl-copy.

# Actions:
# CTRL Del to delete an entry
# ALT Del to wipe clipboard contents

dir="$HOME/.config/rofi/launchers/type-7"
theme='style-5'

while true; do
    result=$(
        rofi -show drun -theme ${dir}/${theme}.rasi -i -dmenu \
            -kb-custom-1 "Control-Delete" \
            -kb-custom-2 "Alt-Delete" \ < <(copyq list)
    )

    case "$?" in
        1)
            exit
            ;;
        0)
            case "$result" in
                "")
                    continue
                    ;;
                *)
                    # Copy the selected item to clipboard
                    copyq select "$(copyq find -m -d "$result" | cut -d' ' -f1)"
                    exit
                    ;;
            esac
            ;;
        10)
            # Delete the selected entry
            copyq remove "$(copyq find -m -d "$result" | cut -d' ' -f1)"
            ;;
        11)
            # Clear clipboard history
            copyq clear
            ;;
    esac
done
