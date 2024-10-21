#!/bin/bash

xrandr --output eDP --rotate right
xinput set-prop 17 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
