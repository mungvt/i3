#! /usr/bin/bash

export DISPLAY=:0
export XAUTHORITY=$HOME/.Xauthority

function connect(){
  xrandr --output eDP-1 --off\
      --output DP-1 --off \
      --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
      --output HDMI-2 --off \
      --output VIRTUAL1 --off
}
  
function disconnect(){
  xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP-1 --off \
    --output HDMI-1 --off \
    --output HDMI-2 --off \
    --output VIRTUAL1 --off
}

function both() {
  xrandr --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP-1 --off \
    --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output HDMI-2 --off \
    --output VIRTUAL1 --off
}
   
function HDMI_connected() {
  xrandr | grep "HDMI-1 connected" &> /dev/null
}

function lid_open() {
  xrandr | grep "DP-1 connected" &> /dev/null
}

if HDMI_connected && ! lid_open
then
  connect
fi

if HDMI_connected && lid_open
then
  both
fi

if ! HDMI_connected && lid_open
then
  disconnect
fi

