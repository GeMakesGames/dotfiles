#!/usr/bin/env bash

# Define the amount to subtract from the width and height
WIDTH_OFFSET=10
HEIGHT_OFFSET=10

# Kill all existing Polybar instances
killall polybar

if type "xrandr"; then
  # Loop through connected monitors
  while IFS= read -r line; do
    # Extract monitor name, width, and height
    m=$(echo "$line" | cut -d" " -f1)
    resolution=$(echo "$line" | grep -oP '\d+x\d+')
    width=$(echo "$resolution" | cut -dx -f1)

    new_width=$((width - WIDTH_OFFSET * 2))
    
    y_offset=${HEIGHT_OFFSET}
    x_offset=${WIDTH_OFFSET}
    # Launch Polybar with monitor name, adjusted width, and height
    MONITOR=$m WIDTH="${new_width}px" Y_OFFSET="${y_offset}px" X_OFFSET="${x_offset}" polybar --reload main &
  done < <(xrandr --query | grep " connected")

else
  # Launch Polybar without specifying a particular monitor
  polybar --reload main &
fi

# Print message
echo "Bars launched..."

