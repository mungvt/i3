#!/bin/bash
CONFIG=$HOME/.config/i3/polybar/config

pgrep polybar | xargs kill

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mybar --config=$CONFIG &
  done
else
  polybar --reload mybar --config=$CONFIG &
fi
