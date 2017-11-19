#!/bin/bash

bluetoothctl -a <<EOT
discoverable on
EOT

sudo chmod 777 /var/run/sdp
sdptool add --channel=22 SP

while :
do 
  if [ -e /dev/rfcomm0 ]; then
    stty -F /dev/ttyACM0 -echo 2> /dev/null
    cat /dev/ttyACM0 1> /dev/rfcomm0 2> /dev/null
  else
    sudo rfcomm listen /dev/rfcomm0 22 > /dev/null 2>&1 &
    sleep 1
  fi
done