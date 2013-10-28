#!/system/bin/sh
echo "#*************************************************"
echo "# Script usage:" 
echo "# $0 <channel #> <mcs index> <Tx power>" 
echo "#"
echo "# Example: test TX with channel 1, mcs 7, 5db"
echo "# $0 1 7 5"
echo "#*************************************************"

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
echo "wlarm chanspec -c $1 -b 2 -w 20 -s 0"
wlarm chanspec -c $1 -b 2 -w 20 -s 0
sleep 1
echo "wlarm nrate -m $2 -s 0"
wlarm nrate -m $2 -s 0
sleep 1
echo "wlarm txpwr1 -o -d $3"
wlarm txpwr1 -o -d $3
sleep 1
echo "wlarm pkteng_start 00:11:22:33:44:55 tx 300 1500 0"
wlarm pkteng_start 00:11:22:33:44:55 tx 300 1500 0
echo "Script end."