#!/bin/bash
# Xin Mo or Juyao 2 Player controllers Script, v16.04.2020

infobox=""
infobox="${infobox}\n"
infobox="${infobox}\n"
infobox="${infobox}Xin Mo & Juyao Dual Player\n\n"
infobox="${infobox}\n"
infobox="${infobox}This script will apply to cmdline the needed settings to use Xin Mo or Juyao Dual Player Controllers.\n"
infobox="${infobox}\n"
infobox="${infobox}\n\n"
infobox="${infobox}**Enable**\nWhen you select the Enable option, the configuration applied"
infobox="${infobox}\n"
infobox="${infobox}**Remove**\nWhen you select the Remove option, the configuration is removed\n"
infobox="${infobox}\n"
infobox="${infobox}\n"

dialog --backtitle "Xin Mo & Juyao Dual Player" \
--title "Xin Mo & Juyao Dual Player by 2Play!" \
--msgbox "${infobox}" 35 110

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Enable Xin Mo Controller" \
            2 "Enable Juyao Controller" \
            3 "Remove Xin Mo or Juyao Controller" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) enable_X  ;;
            2) enable_J  ;;
            3) remove_XJ  ;;
            *) break ;;
        esac
    done
}


function enable_X() {
	dialog --infobox "...Applying..." 3 20 ; sleep 2
	sudo sed -i 's/$/ usbhid.quirks=0x16c0:0x05e1:0x040/' /boot/cmdline.txt
}

function enable_J() {
	dialog --infobox "...Applying..." 3 20 ; sleep 2
	sudo sed -i 's/$/ usbhid.quirks=0x0314:0x0328:0x040/' /boot/cmdline.txt
}

function remove_XJ() {
	dialog --infobox "...Removing..." 3 20 ; sleep 2
	sudo sed -i 's/ usbhid.quirks=0x16c0:0x05e1:0x040//g; s/ usbhid.quirks=0x0314:0x0328:0x040//g;' /boot/cmdline.txt
}

main_menu
