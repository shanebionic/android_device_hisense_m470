#!/bin/bash
# echo "1" >/sys/class/gpio/gpio120/value
/system/bin/glgps_nvidiaTegra2android -c /system/etc/gps/gpsconfig.xml Periodic & 
sleep 1
cat data/gps/gpspipe

