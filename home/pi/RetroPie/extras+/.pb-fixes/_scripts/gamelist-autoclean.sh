#!/bin/bash
# Clear AutoLastPlayed & PlayCount or Favorites Script
# Original code by tanstaafl
# Updated code and Multi script by 2Play!
# The PlayBox Project
# Copyright (C)2018-2020 2Play! (S.R.)
# 03.07.20

infobox=""
infobox="${infobox}\n"
infobox="${infobox}\n"
infobox="${infobox}Clear AutoLastPlayed & PlayCount or Favorites Script\n\n"
infobox="${infobox}\n"
infobox="${infobox}You can automatically clear the AutoLastPlayed & PlayCount or Favorites from all of your gamelist.xml's\n"
infobox="${infobox}\n"
infobox="${infobox}\n\n"
infobox="${infobox}Option 1 & 4: Will clear gamelists in Roms directory"
infobox="${infobox}\n"
infobox="${infobox}Option 2 & 5: Will clear gamelists in ES gamelists directory"
infobox="${infobox}\n"
infobox="${infobox}Option 3 & 6: Will clear gamelists in both directories"
infobox="${infobox}\n"
infobox="${infobox}\n"

dialog --backtitle "Gamelist Clearing Script" \
--title "Clear AutoLastPlayed & PlayCount or Favorites Script by 2Play!" \
--msgbox "${infobox}" 35 110

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Clear AutoLastPlayed & PlayCount in Roms Directory" \
            2 "Clear AutoLastPlayed & PlayCount in ES Gamelists Directory" \
            3 "Clear AutoLastPlayed & PlayCount Both Directories" \
            4 "Clear Favorites in Roms Directory" \
            5 "Clear Favorites in ES Gamelists Directory" \
            6 "Clear Favorites Both Directories" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) clear_R1  ;;
            2) clear_ES1  ;;
            3) clear_ALL1  ;;
            4) clear_R2  ;;
            5) clear_ES2  ;;
            6) clear_ALL2  ;;
            *) break ;;
        esac
    done
}


function clear_R1() {
	dialog --infobox "...Clearing..." 3 20 ; sleep 2
#sudo killall emulationstation
for f in /home/pi/RetroPie/roms/**/gamelist.xml
do
echo "file: $f"
grep -e lastplayed -e playcount -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
for f in /home/pi/RetroPie/roms/ports/**/gamelist.xml
do
echo "file: $f"
grep -e lastplayed -e playcount -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
}

function clear_ES1() {
	dialog --infobox "...Clearing..." 3 20 ; sleep 2
#sudo killall emulationstation
for f in /opt/retropie/configs/all/emulationstation/gamelists/**/gamelist.xml
do
echo "file: $f"
grep -e lastplayed -e playcount -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
sleep 2
}

function clear_ALL1() {
	dialog --infobox "...Clearing..." 3 20 ; sleep 2
#sudo killall emulationstation
for f in /home/pi/RetroPie/roms/**/gamelist.xml
do
echo "file: $f"
grep -e lastplayed -e playcount -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
for f in /opt/retropie/configs/all/emulationstation/gamelists/**/gamelist.xml
do
echo "file: $f"
grep -e lastplayed -e playcount -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
for f in /home/pi/RetroPie/roms/ports/**/gamelist.xml
do
echo "file: $f"
grep -e lastplayed -e playcount -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
}

function clear_R2() {
	dialog --infobox "...Clearing..." 3 20 ; sleep 2
#sudo killall emulationstation
for f in /home/pi/RetroPie/roms/**/gamelist.xml
do
echo "file: $f"
grep -e "favorite>" -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
for f in /home/pi/RetroPie/roms/ports/**/gamelist.xml
do
echo "file: $f"
grep -e "favorite>" -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
}

function clear_ES2() {
	dialog --infobox "...Clearing..." 3 20 ; sleep 2
#sudo killall emulationstation
for f in /opt/retropie/configs/all/emulationstation/gamelists/**/gamelist.xml
do
echo "file: $f"
grep -e "favorite>" -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
sleep 2
}

function clear_ALL2() {
	dialog --infobox "...Clearing..." 3 20 ; sleep 2
#sudo killall emulationstation
for f in /home/pi/RetroPie/roms/**/gamelist.xml
do
echo "file: $f"
grep -e "favorite>" -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
for f in /opt/retropie/configs/all/emulationstation/gamelists/**/gamelist.xml
do
echo "file: $f"
grep -e "favorite>" -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
for f in /home/pi/RetroPie/roms/ports/**/gamelist.xml
do
echo "file: $f"
grep -e "favorite>" -v $f > "$f.tmp"
mv -f "$f.tmp" $f
done
echo "Completed!"
sleep 2
}

main_menu