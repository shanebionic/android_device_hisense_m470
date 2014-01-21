#!/system/bin/sh
ifconfig wlan0 down
echo 0 > /sys/module/bcmdhd/parameters/dhd_test_mode_flag
