#!/bin/bash
IMAGE_PATH="/tmp"
SCROT_NAME="$IMAGE_PATH/i3_screenshot.png"

# Take screenshot
scrot $SCROT_NAME

# Pixelate background
convert $SCROT_NAME -scale 10% -scale 1000% $SCROT_NAME

# Lock screen
i3lock -i $SCROT_NAME
