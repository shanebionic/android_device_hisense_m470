#!/bin/bash
/system/bin/glgps_nvidiaTegra2android -c /system/etc/gps/gpsconfig.xml Factory_High_SNR &
sleep 6
/system/bin/gpstest
