#!/system/bin/sh
echo "#*************************************************"
echo "# Script usage:" 
echo "# $0 <tx|rx>" 
echo "#"
echo "# Example: to stop tx"
echo "# $0 tx"
echo "#*************************************************"

echo "wlarm pkteng_stop $1"
wlarm pkteng_stop $1
echo "Script end."