#! /usr/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/dawn/.Xauthority

function connect(){
    /usr/bin/xrandr --output eDP1 --off\
      --output DP1 --off \
      --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
      --output HDMI2 --off \
      --output VIRTUAL1 --off
}
  
function disconnect(){
  /usr/bin/xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal \
    --output DP1 --off \
    --output HDMI1 --off \
    --output HDMI2 --off \
    --output VIRTUAL1 --off
}
   
/usr/bin/xrandr | grep "HDMI1 connected" &> /dev/null && connect || disconnect

