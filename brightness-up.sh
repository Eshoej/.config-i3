#!/bin/bash
echo "Running brightness-up.sh" >> /tmp/brightness.log
BRIGHTNESS_FILE="/sys/class/backlight/amdgpu_bl1/brightness"
MAX=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
CUR=$(cat $BRIGHTNESS_FILE)
STEP=$((MAX / 10))
NEW=$((CUR + STEP))

if [ $NEW -gt $MAX ]; then
  NEW=$MAX
fi

echo $NEW | sudo tee $BRIGHTNESS_FILE

