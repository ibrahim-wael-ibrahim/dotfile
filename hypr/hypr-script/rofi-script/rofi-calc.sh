#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */
# /* Calculator (using qalculate) and rofi */
# /* Submitted by: https://github.com/JosephArmas */

dir="$HOME/.config/rofi/launchers/type-7"
theme='style-5'
# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
    exit 0
fi

# main function

while true; do
    result=$(
        rofi  -show drun -theme ${dir}/${theme}.rasi  -i -dmenu \
            -mesg " ( $result )      =>    $calc_result "
    )

    if [ $? -ne 0 ]; then
        exit
    fi

    if [ -n "$result" ]; then
        calc_result=$(qalc -t "$result")
        echo "$calc_result" | wl-copy
    fi
done
