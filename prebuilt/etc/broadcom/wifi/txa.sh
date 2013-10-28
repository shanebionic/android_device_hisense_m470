#!/system/bin/sh
echo "#*************************************************"
echo "# Script usage:" 
echo "# $0 <channel #> <bg_rate> <Tx power>" 
echo "#"
echo "# Example: test TX with channel 1, 54Mbps, 5db"
echo "# $0 1 54 5"
echo "#*************************************************"
echo "wlarm ver"
wlarm ver
sleep 3
echo "wlarm down"
wlarm down
sleep 1
echo "wlarm up"
wlarm up
sleep 1
echo "wlarm mpc 0"
wlarm mpc 0
sleep 1
echo "wlarm up"
wlarm up
sleep 1
echo "wlarm band a"
wlarm band a
sleep 1
echo "wlarm channel $1"
wlarm channel $1
sleep 1
echo "wlarm rate $2"
wlarm rate $2
sleep 1
echo "wlarm txpwr1 -o -d $3"
wlarm txpwr1 -o -d $3
sleep 1
echo "wlarm pkteng_start 00:11:22:33:44:55 tx 300 1500 0"
wlarm pkteng_start 00:11:22:33:44:55 tx 300 1500 0
echo "wlarm phy_forcecal 1"
wlarm phy_forcecal 1
echo "Script end."