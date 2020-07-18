#!/bin/bash
# The PlayBox Project
# Copyright (C)2018-2020 2Play! (S.R.)
# PlayBox ToolKit 13.07.20

infobox=""
infobox="${infobox}        __________.__                 __________                
\n"
infobox="${infobox}        \______   \  | _____   ___.__.\______   \ ________  ___ 
\n"
infobox="${infobox}         |     ___/  | \__  \ <   |  | |    |  _//  _  \  \/  / 
\n"
infobox="${infobox}         |    |   |  |__/ __ \ \___  | |    |   (  <_>  >    <  
\n"
infobox="${infobox}         |____|   |____(____  )/ ____| |______  /\_____/__/\_ \ 
\n"
infobox="${infobox}                            \/ \/             \/             \/ \n"
infobox="${infobox}                                                              By 2Play!\n"
infobox="${infobox}\n"
infobox="${infobox}This script can fix a broken configuration to its original state, as initially created by me!.\n"
infobox="${infobox}This can happen by updates or manual changes.\n"
infobox="${infobox}\n"
infobox="${infobox}I have set descriptive options for easy reference!\n"
infobox="${infobox}\n"
infobox="${infobox}**NOTE**:\n- For some script its safer to run ONLY from command line interface (cli). \nSo exit to cli (F4), type '2p', press TAB then hit ENTER to run it!\n- Or press Arrow Key Up to select it from the top commands left in cli history for easy access.\n"
infobox="${infobox}\n"

dialog --backtitle "Repair ToolKit" \
--title "PlayBox Repair ToolKit & More!!!" \
--msgbox "${infobox}" 35 110

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Which fix or action would you like to apply?" 25 75 20 \
            1 "Fix:  Fix PlayBox Custom Retropie Menu" \
            2 "Fix:  Set Your Region US/EU-JP/ALL (es_systems)" \
            3 "Fix:  Repair BGM Emulator Mute Config File" \
            4 "Fix:  Restore 2Play! Original Slideshow Images Set" \
            5 "Fix:  Reset All RetroPie Controllers Configuration" \
            6 "Fix:  Restore 2Play! Top CLi Commands History" \
            7 "Fix:  Fix-Reset-Clean git for RetroPie Setup " \
            8 "Fix:  Force Filesystem Recheck At Next Boot " \
            9 "Tool:  Skyscraper By Lars Muldjord		***Only from cli***" \
           10 "Tool:  OMXPlayer Volume Control Script" \
           11 "Cleanup:  Clean all save, hi, dat etc files in roms folder" \
           12 "Cleanup:  Cleanup Favorites & More		***Only from cli***" \
           13 "Cleanup:  ES Auto Gamelists Cleanup		***Only from cli***" \
           14 "Cleanup:  Filesystem Cache Cleanup" \
           15 "Info:  Show Partitions & Space Info" \
           16 "Info:  Show System Free Memory Info" \
           17 "Info:  Show OS Version & Info" \
           18 "System:  System Update" \
           19 "System:  System Full Info" \
           20 "System:  System Shutdown" \
           21 "System:  System Reboot" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) fix_rpiem  ;;
            2) fix_region  ;;
            3) fix_bgm_py  ;;
            4) fix_slideshow  ;;
            5) fix_control  ;;
            6) fix_cli_hist  ;;
            7) git_rs  ;;
            8) fschk_bt  ;;
            9) skyscraper  ;;
           10) omxvol  ;;
           11) cl_saves  ;;
           12) cl_xml  ;;
           13) cl_es_gamelist  ;;
           14) cl_cache  ;;
           15) partitions  ;;
           16) freemem  ;;
           17) os_info  ;;
           18) os_update  ;;
           19) sysinfo  ;;
           20) shutdown_pb  ;;
           21) reboot_pb  ;;
            *)  break ;;
        esac
    done
}

function fix_rpiem() {
	dialog --infobox "...Fixing..." 3 17 ; sleep 1
	clear
	mv -f /home/pi/RetroPie/retropiemenu/raspiconfig.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu
	mv -f /home/pi/RetroPie/retropiemenu/rpsetup.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu
	mv -f /home/pi/RetroPie/retropiemenu/configedit.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Emulation
	mv -f /home/pi/RetroPie/retropiemenu/retroarch.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Emulation
	mv -f /home/pi/RetroPie/retropiemenu/retronetplay.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Emulation
	mv -f /home/pi/RetroPie/retropiemenu/bluetooth.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Network
	mv -f /home/pi/RetroPie/retropiemenu/showip.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Network
	mv -f /home/pi/RetroPie/retropiemenu/wifi.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Network
	mv -f /home/pi/RetroPie/retropiemenu/audiosettings.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System
	mv -f /home/pi/RetroPie/retropiemenu/filemanager.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System
	mv -f /home/pi/RetroPie/retropiemenu/runcommand.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System
	mv -f /home/pi/RetroPie/retropiemenu/esthemes.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Visuals
	mv -f /home/pi/RetroPie/retropiemenu/splashscreen.rp /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Visuals
	mv -f /home/pi/RetroPie/retropiemenu/hurstythemes.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Visuals
	mv -f /home/pi/RetroPie/retropiemenu/bezelproject.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Visuals
	rsync -avh --delete $HOME/RetroPie/extras+/.pb-fixes/retropiemenu/ $HOME/RetroPie/retropiemenu && find $HOME -name "*.rp" ! -name "raspiconfig.rp" ! -name "rpsetup.rp" | xargs sudo chown root:root && cp $HOME/RetroPie/extras+/.pb-fixes/retropie-gml/gamelist2play.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
	sudo rm -rf /etc/emulationstation/themes/carbon/
}

function fix_region() {
	dialog --infobox "...Starting..." 3 17 ; sleep 1
	clear
	/home/pi/RetroPie/extras+/.pb-fixes/_scripts/region.sh	
}

function fix_bgm_py() {
	dialog --infobox "...Fixing..." 3 17 ; sleep 1
	if [ -d $HOME/addonusb ]; then
	cp /home/pi/RetroPie/extras+/.pb-fixes/bgm/.livewire.py /home/pi
	cd $HOME
	sed -i 's+/home/pi/RetroPie/roms+/home/pi/RetroPie/localroms+g' .livewire.py
	else
	cp /home/pi/RetroPie/extras+/.pb-fixes/bgm/.livewire.py /home/pi
	cd $HOME
	sed -i 's+/home/pi/RetroPie/localroms+/home/pi/RetroPie/roms+g' .livewire.py
	fi
}

function fix_slideshow() {
	dialog --infobox "...Fixing..." 3 17 ; sleep 1
	clear
	rsync -av /home/pi/RetroPie/extras+/.pb-fixes/slideshow/image /opt/retropie/configs/all/emulationstation/slideshow/
}

function fix_control() {
	dialog --infobox "...Fixing..." 3 17 ; sleep 1
	rm /opt/retropie/configs/all/retroarch-joypads/*
	cp /home/pi/RetroPie/extras+/.pb-fixes/es_cfg/es_input.cfg /home/pi/.emulationstation/
	echo
	read -n 1 -s -r -p "Press any key to continue. Dont forget to reboot!!!"
}

function fix_cli_hist() {
	dialog --infobox "...Fixing..." 3 17 ; sleep 1
	cat /dev/null > ~/.bash_history && history -c && cp /home/pi/RetroPie/extras+/.pb-fixes/cli/.bash_history /home/pi/
}

function git_rs() {
	dialog --infobox "...Fixing..." 3 17 ; sleep 1
	cd RetroPie-Setup && git reset --hard && git clean -f -d
}

function fschk_bt() {
	dialog --infobox "...Please Wait..." 3 22 ; sleep 1
	clear
	echo
	echo "Please be patient... Screen will go black, pi's green activity led will be on while filsystem check. Once completed your system will reboot as normal."
	sleep 5
	sudo touch /forcefsck && sudo reboot
}

function skyscraper() {
	dialog --infobox "...Starting..." 3 20 ; sleep 1
	clear
	Skyscraper
}

function omxvol() {
	dialog --infobox "...Starting..." 3 20 ; sleep 1
	clear
	/home/pi/RetroPie/extras+/.pb-fixes/_scripts/omxvol.sh
}

function cl_saves() {
	dialog --infobox "...Cleaning..." 3 20 ; sleep 1
	clear
	find /home/pi/RetroPie/roms/ -regextype posix-egrep -regex ".*\.(srm|auto|state.auto|fs|hi)$" -type f -delete
	find /home/pi/RetroPie/roms/daphne/ -regextype posix-egrep -regex ".*\.(srm|auto|state.auto|fs|hi|dat)$" -type f -delete
	find /home/pi/RetroPie/saves/ -regextype posix-egrep -regex ".*\.(srm|auto|state.auto|fs|hi|dat)$" -type f -delete
}

function cl_xml() {
	dialog --infobox "...Please Wait..." 3 22 ; sleep 1
	clear
	/home/pi/RetroPie/extras+/.pb-fixes/_scripts/gamelist-autoclean.sh
}

function cl_es_gamelist() {
	dialog --infobox "...Please Wait..." 3 22 ; sleep 1
	clear
#	find /opt/retropie/configs/all/emulationstation/gamelists/ -type f -name '*.xml' ! -path "./retropie" -exec rm {} \;
	find /opt/retropie/configs/all/emulationstation/gamelists/ -type f -name '*.xml' ! -path "/opt/retropie/configs/all/emulationstation/gamelists/retropie/*" -exec rm {} \;
#	find /opt/retropie/configs/all/emulationstation/gamelists/ -type f -name '*.xml' -exec rm {} \;
}

function cl_cache() {
	dialog --infobox "...Cleaning..." 3 20 ; sleep 1
	clear
	sudo apt-get clean
}

function partitions() {
	dialog --infobox "...Checking..." 3 20 ; sleep 1
	clear
	df -h
	echo
	read -n 1 -s -r -p "Press any key to continue"
}

function freemem() {
	dialog --infobox "...Checking..." 3 20 ; sleep 1
	clear
	free mem
	echo
	read -n 1 -s -r -p "Press any key to continue"
}

function os_info() {
	dialog --infobox "...Checking..." 3 20 ; sleep 2
	clear
	uname -snrmo
	lsb_release -ds
	echo
	read -n 1 -s -r -p "Press any key to continue"
}

function os_update() {
	dialog --infobox "...Please wait until updates completed!..." 3 50 ; sleep 2
	clear
	sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove --purge && sudo apt-get clean
	sleep 3
	sudo reboot
}

function sysinfo() {
	dialog --infobox "...Please Wait..." 3 22 ; sleep 1
	clear
	/home/pi/RetroPie/extras+/.pb-fixes/_scripts/2play_sysinfo.sh
}

function shutdown_pb() {
	dialog --infobox "...Shutting Down..." 3 23 ; sleep 1
	clear
	echo
	echo "[OK System Will Shutdown now...]"
#	sudo shutdown -h now
	sudo shutdown -P now
}

function reboot_pb() {
	dialog --infobox "...Starting..." 3 20 ; sleep 1
	clear
	echo
	echo "[OK System Will Restart now...]"
	sudo reboot
}
main_menu
