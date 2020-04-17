#!/usr/bin/env bash

infobox= ""
infobox="${infobox}\n"
infobox="${infobox}Install Background Music\n\n"
infobox="${infobox}This script will install and setup background music for you.\n"
infobox="${infobox}	NOTE: Your system will reboot after removal or Install of Background Music\n"
infobox="${infobox}Just copy your mp3 files to the 'music' directory in your roms directory.\n"
infobox="${infobox}Once installed you can adjust the volume to your liking with this script as well.\n"
infobox="${infobox}There is also a 'Music On/Off' script to your default 'Retropie' menu so you can mute the music off or on at will.\n\n"
infobox="${infobox}\n"
infobox="${infobox}\n"
infobox="${infobox} Original script By Forrest aka Eazy Hax & tweaked by 2Play!\n"
infobox="${infobox}\n"

dialog --backtitle "Background Music By Eazy Hax - 2Play!" \
--title "Background Music Script" \
--msgbox "${infobox}" 23 80

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Remove Background Music" \
            2 "Set Background Music Volume - Only after installed" \
            3 "Install Background Music" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) remove_bgm  ;;
            2) vol_menu  ;;
            3) install_bgm  ;;
            *)  break ;;
        esac
    done
}

function vol_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "You can choose the volume level one after another until you are happy with your settings." 25 75 20 \
            1 "Set Background Music volume to 100%" \
            2 "Set Background Music volume to 90%" \
            3 "Set Background Music volume to 80%" \
            4 "Set Background Music volume to 70%" \
            5 "Set Background Music volume to 60%" \
            6 "Set Background Music volume to 50%" \
            7 "Set Background Music volume to 40%" \
            8 "Set Background Music volume to 30%" \
            9 "Set Background Music volume to 20%" \
            10 "Set Background Music volume to 10%" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) 100_v  ;;
            2) 90_v  ;;
            3) 80_v  ;;
            4) 70_v  ;;
            5) 60_v  ;;
            6) 50_v  ;;
            7) 40_v  ;;
            8) 30_v  ;;
            9) 20_v  ;;
            10) 10_v  ;;
            *)  break ;;
        esac
    done
}

function install_bgm() {
        sudo grep livewire /etc/rc.local > /dev/null 2>&1
        if [ $? -eq 0 ] ; then
        clear
		echo
		echo "STEP 1: Checking BGM Status..."
		sleep 3
		echo -e "\n\n\n         It looks like Background Music is already installed. Exiting......\n\n\n"
        sleep 5
        exit
        fi
        PKG=python-pygame
        PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $PKG|grep "install ok installed")
        if [ "" == "$PKG_OK" ]; then
                echo
				echo "STEP 2: Checking Requirements..."
				sleep 3
				echo -e "\n\n\n     No $PKG installed. Setting up $PKG.\n\n\n"
                sleep 3
                sudo apt-get update; sudo apt-get install -y $PKG
        else
        echo -e "\n\n\n    $PKG seems to be installed...moving on with the background music install"
        sleep 3
        fi
        sudo cp /home/pi/RetroPie/extras+/bgm/.livewire.py /home/pi/
        sudo perl -i.bak -pe '$_ = qq[(sudo python /home/pi/.livewire.py) &\n$_] if $_ eq qq[exit 0\n]'  /etc/rc.local
        if [ ! -d "$HOME/RetroPie/roms/music" ]; then
                echo -e "\n\n\n    Music directory is missing. Will enable it for you you.\n\n\n"
                sleep 3
                sudo mv /home/pi/RetroPie/roms/music.OFF /home/pi/RetroPie/roms/music
        fi
        echo
		echo "STEP 3: Checking if USB Drive Roms exists..."
		sleep 3
		echo -e "\n\n\n         Checking to see if you are using the Eazy Hax external drive expansion......\n\n\n"
        if [ -d "$HOME/RetroPie/localroms/music" ]; then
            perl -p -i -e 's/\/home\/pi\/RetroPie\/roms\/music/\/home\/pi\/RetroPie\/localroms\/music/g' /home/pi/.livewire.py
        fi
        vol_menu
}

function remove_bgm() {
	pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
    echo
	echo "STEP: Removing BGM..."
	sleep 3
	rm /home/pi/.livewire.py
	if [ -e /home/pi/.DisableMusic ]; then
		rm /home/pi/.DisableMusic
	fi
	mv /home/pi/RetroPie/roms/music /home/pi/RetroPie/roms/music.OFF
	sudo sed -i '/livewire/d' /etc/rc.local
	echo -e "\n\n\n         Background Music has been removed from your system.\n\n\n"
	sleep 5
}



function 100_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 1.0/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 90_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.90/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 80_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.80/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 70_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 70.0/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 60_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 60.0/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 50_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.50/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 40_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.40/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 30_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.30/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 20_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.20/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}
function 10_v() {
        CUR_VAL=`grep "maxvolume =" /home/pi/.livewire.py|awk '{print $3}'`
        export CUR_VAL
        perl -p -i -e 's/maxvolume = $ENV{CUR_VAL}/maxvolume = 0.10/g' /home/pi/.livewire.py
        pgrep -f "python /home/pi/.livewire.py"|xargs sudo kill -9
        (sudo python /home/pi/.livewire.py) &
}

main_menu
