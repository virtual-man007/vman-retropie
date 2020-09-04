#fbset -fb /dev/fb0 -g 1920 1080 1920 1080 16
isdual=`tvservice -l |grep "2 attached device" |wc -l`
if [[ $isdual == "1" ]]; then
  /usr/bin/python /home/pi/PieMarquee2/PieMarquee2/PieMarquee2.py &
fi
/home/pi/scripts/themerandom.sh
emulationstation --no-splash auto