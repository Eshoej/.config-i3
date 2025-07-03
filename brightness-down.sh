#!/bin/bash
echo "hello"
BRIGHTNESS_FILE="/sys/class/backlight/amdgpu_bl1/brightness"
MAX=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
CUR=$(cat $BRIGHTNESS_FILE)
STEP=$((MAX / 10))
NEW=$((CUR - STEP))

if [ $NEW -lt 1 ]; then
  NEW=1
fi

echo $NEW | sudo tee $BRIGHTNESS_FILE

