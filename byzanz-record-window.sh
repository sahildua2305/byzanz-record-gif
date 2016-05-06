#!/bin/bash


# Check for byzanz and install it if not installed already
if [ $(dpkg-query -W -f='${Status}' byzanz 2>/dev/null | grep -c "ok installed") == "0" ]; then
	echo "'byzanz' is not installed."
	echo "Trying to install it now..."
	echo
	echo
	if sudo apt-get --assume-yes install byzanz; then
		echo "Installed 'byzanz' successfully."
		echo
	else
		echo "Unable to install byzanz. Please try again."
		exit 1
	fi
fi

if [ $# -gt 0 ]; then
	DELAY="$1"
else
	DELAY=10
fi

# Duration and output file
if [ $# -gt 0 ]; then
    D="--duration=$2 $3"
else
    echo Default recording duration 10s to /tmp/recorded.gif
    D="--duration=10 /tmp/recorded.gif"
fi

echo
echo "Go to the window (alt+tab) you want to capture and click on it."
echo "Waiting for you to click on a window to record..."
echo

# Ask for selecting the window
XWININFO=$(xwininfo)
read X <<< $(awk -F: '/Absolute upper-left X/{print $2}' <<< "$XWININFO")
read Y <<< $(awk -F: '/Absolute upper-left Y/{print $2}' <<< "$XWININFO")
read W <<< $(awk -F: '/Width/{print $2}' <<< "$XWININFO")
read H <<< $(awk -F: '/Height/{print $2}' <<< "$XWININFO")

echo Delaying $DELAY seconds. After that, byzanz will start recording

for (( i=$DELAY; i>0; --i )) ; do
    echo $i
    sleep 1
done

byzanz-record --verbose --delay=0 --x=$X --y=$Y --width=$W --height=$H $D

# Show notication upon recording completion
notify-send "Byzanz recording" "
Recording completed" -t 2000
