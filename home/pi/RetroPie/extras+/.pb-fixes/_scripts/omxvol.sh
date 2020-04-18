#!/bin/bash
# OMXPlayer Volume Control v18.04.2020 By 2Play! 

infobox=""
infobox="${infobox}\n"
infobox="${infobox}OMXPlayer Volume Control\n\n"
infobox="${infobox}\n"
infobox="${infobox}This script will allow you to set the omxplayer volume to your liking.\n"
infobox="${infobox}\n"
infobox="${infobox}\n\n"
infobox="${infobox}**Select the %**\n"
infobox="${infobox}\n"
infobox="${infobox}\n"
infobox="${infobox}\n"

dialog --backtitle "OMXPlayer Volume Control" \
--title "OMXPlayer Volume Control Script by 2Play!" \
--msgbox "${infobox}" 35 110

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Please Set OMXPlayer Volume:" 25 75 20 \
            1 " - Set to 75%" \
            2 " - Set to 70%" \
            3 " - Set to 60%" \
            4 " - Set to 50%" \
            5 " - Set to 25%" \
            6 " - Set to 100% (Default)" \
            7 " - Set to 0% (Mute)" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) omx75  ;;
            2) omx70  ;;
            3) omx60  ;;
            4) omx50  ;;
            5) omx25  ;;
            6) omx100  ;;
            7) omx0  ;;
            -) none ;;
            *)  break ;;
        esac
    done
}


function omx75() {
	dialog --infobox "...Applying..." 3 20 ; sleep 1
	 sudo sed -i 's/$OMXPLAYER_BIN/$OMXPLAYER_BIN --vol -1500/g' /usr/bin/omxplayer
}

function omx70() {
	dialog --infobox "...Applying..." 3 20 ; sleep 1
	 sudo sed -i 's/$OMXPLAYER_BIN/$OMXPLAYER_BIN --vol -1750/g' /usr/bin/omxplayer
}

function omx60() {
	dialog --infobox "...Applying..." 3 20 ; sleep 1
	 sudo sed -i 's/$OMXPLAYER_BIN/$OMXPLAYER_BIN --vol -2400/g' /usr/bin/omxplayer
}

function omx50() {
	dialog --infobox "...Applying..." 3 20 ; sleep 1
	 sudo sed -i 's/$OMXPLAYER_BIN/$OMXPLAYER_BIN --vol -3000/g' /usr/bin/omxplayer
}

function omx25() {
	dialog --infobox "...Applying..." 3 20 ; sleep 1
	 sudo sed -i 's/$OMXPLAYER_BIN/$OMXPLAYER_BIN --vol -4500/g' /usr/bin/omxplayer
}

function omx100() {
	dialog --infobox "...Applying..." 3 20 ; sleep 1
	 sudo sed -i 's/$OMXPLAYER_BIN --vol -[0-9]*/$OMXPLAYER_BIN/g' /usr/bin/omxplayer
}

function omx0() {
	dialog --infobox "...Applying..." 3 20 ; sleep 1
	 sudo sed -i 's/$OMXPLAYER_BIN/$OMXPLAYER_BIN --vol -6000/g' /usr/bin/omxplayer
}

main_menu
