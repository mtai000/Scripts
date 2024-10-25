#!/bin/bash

xrandr --output eDP --rotate right
device_id=$(xinput list | grep 'FTS3528:00 2808:1015' | grep -v 'UNKNOW' | awk -F'id=' '{print $2}' | awk '{print $1}')
xinput set-prop $device_id 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
