#!/bin/bash
# Eazy Hax USB Combo Script by 2Play!

infobox=""
infobox="${infobox}\n"
infobox="${infobox}Enable or Disable and external USB ROMs dir\n\n"
infobox="${infobox}\n"
infobox="${infobox}It allows you to select  to initally enable a new drive and remove it when not needed or when you are planning to install a new one!\n"
infobox="${infobox}"
infobox="${infobox}\n"
infobox="${infobox}\n"
infobox="${infobox}\n"
infobox="${infobox}**Enable**\nWhen you run the Enable option, the connected USB drive will be used to store ROMS"
infobox="${infobox}\n"
infobox="${infobox}**Disable**\nWhen you run the Disable option, the configuration will be removed and you can install a new drive"
infobox="${infobox}\n"
infobox="${infobox}\n"

dialog --backtitle "Roms on External USB" \
--title "Extend Roms on External USB Combo Script By 2Play! Original Script by Eazy Hax." \
--msgbox "${infobox}" 35 110



function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose your Roms USB Option:" 25 75 20 \
            1 " - Enable Roms on external USB" \
            2 " - Disable Roms on external USB" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) enable_usb  ;;
            2) disable_usb  ;;
            *)  break ;;
        esac
    done
}


function enable_usb() {
dialog --infobox "...Applying..." 3 20 ; sleep 2
 /home/pi/RetroPie/extras+/usb/usb-on.sh
}

function disable_usb() {
dialog --infobox "...Applying..." 3 20 ; sleep 2
 /home/pi/RetroPie/extras+/usb/usb-off.sh
}

main_menu

