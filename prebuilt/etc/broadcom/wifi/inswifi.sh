#!/system/bin/sh
echo -n "/etc/broadcom/wifi/fw_bcmdhd_test.bin" > /sys/module/bcmdhd/parameters/firmware_path
ifconfig wlan0 up
