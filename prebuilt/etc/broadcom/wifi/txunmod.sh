#!/system/bin/sh
echo "#*************************************************"
echo "# Script usage:" 
echo "# $0 <channel #>" 
echo "#"
echo "# Example: Send continuous TX single tone at channel 1"
echo "# $0 1"
echo "# Example: STOP continuous TX single tone"
echo "# $0 0"
echo "#*************************************************"

echo "./wlarm down"
wlarm down
sleep 1
echo "./wlarm up"
wlarm up
sleep 1
echo "./wlarm mpc 0"
wlarm mpc 0
sleep 1
echo "./wlarm up"
wlarm up
sleep 1
echo "./wlarm out"
wlarm out
sleep 1
echo "./wlarm fqacurcy $1"
wlarm fqacurcy $1
sleep 1
echo "Script end."
