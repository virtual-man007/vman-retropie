#!/bin/bash
# Eazy Hax USB Combo Script by 2Play!
# 25.06.20

infobox=""
infobox="${infobox}\n"
infobox="${infobox}It allows you to enable the EZH - USB Extra ROMs NTFS drive or remove when you are planning to install a new one or just remove it!\nWithout it, just the SD ROMs Setup will be used.\n\n"
infobox="${infobox}**ENABLE OPTION - README**\n- The connected USB drive will be used to store extra ROMs.\n- IF you WANT your ART folders also on USB then you need to edit the XML for that specific folder you have ART also on USB."
infobox="${infobox}\n\n"
infobox="${infobox}**DISABLE OPTION - README**\n- The USB configuration will be removed and you can install a new drive or use only the ROMs on your SD.\n- IF you have CHANGED any XML then to you need revert back to original setup.\n\n"
infobox="${infobox}Original scipts by EZH aka Forrest. Combined and updated by 2Play!\n"
infobox="${infobox}\n"

dialog --backtitle "ROMs on External USB" \
--title "EXTERNAL NTFS USB ROMS COMBO SCRIPT" \
--msgbox "${infobox}" 35 110



function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " EXTERNAL USB MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose your Roms USB Option:" 25 75 20 \
            - "*** EXTERNAL USB HDD SELECTIONS ***" \
            1 " - ENABLE External USB ROMs" \
            2 " - DISABLE External USB ROMs" \
			- "" \
            - "*** EXTERNAL USB ENABLED - ART,XML OPTIONS ***" \
            3 " - I have ADD-ONS Related ROMs, ART Folders & XML on USB " \
			- "" \
			- "*** EXTERNAL USB DISABLED - RESTORE ALL TO DEFAULT ***" \
			4 " - I have ALL ROMS, XML & ART Folders on SD " \
            2>&1 > /dev/tty)

        case "$choice" in
            1) enable_usb  ;;
            2) disable_usb  ;;
            3) addon_art_usb  ;;
			4) all_sd  ;;
			-) none  ;;
            *)  break ;;
        esac
    done
	clear
}


function enable_usb() {
dialog --infobox "...Applying..." 3 20 ; sleep 2
 $HOME/RetroPie/extras+/usb/usb-on.sh
}

function disable_usb() {
dialog --infobox "...Applying..." 3 20 ; sleep 2
 $HOME/RetroPie/extras+/usb/usb-off.sh
}

function addon_art_usb() {
dialog --infobox "...OK Let's Do It..." 3 25 ; sleep 1
clear
cd $HOME/addonusb/roms
	echo 
	echo " I will display a list of all USB Rom folders..."
	echo " If you can't see full list. Use below keys to scroll or exit list!"
	echo
	echo "----------------------------------------------------------------------"
	echo " <space>		Display next k lines of text [current screen size]"
	echo " <return>		Display next k lines of text [1]*"
	echo " d			Scroll k lines [current scroll size, initially 11]*"
	echo " q			Exit from more"
	echo "----------------------------------------------------------------------"
	echo
	echo ***PLEASE TYPE THE SYSTEM NAME AS IS IN THE ROMS LIST***
	echo 
	echo Example: arcade
	echo NOT Arcade or ARCADE etc...
	echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo
	ls | column | more -d
	echo
	read -p 'So which system would you like to update: ' sname
	echo
	cd $sname
	find . -type f -name "gamelist.xml" -print0 | xargs -0 sed -i 's#<image>.#<image>'$HOME'/addonusb/roms/'$sname'#g; s#<marquee>.#<marquee>'$HOME'/addonusb/roms/'$sname'#g; s#<video>.#<video>'$HOME'/addonusb/roms/'$sname'#g'
	echo
	echo "[OK DONE!...]"
	sleep 1
}

function all_sd() {
dialog --infobox "...Restoring!..." 3 21 ; sleep 2
clear
cd $HOME/RetroPie
 if [ -d $HOME/addonusb ]; then
	echo
    echo "The External USB is enabled..."
	echo "Using correct path..."
    echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo
	cd $HOME/addonusb/roms
	find . -type f -name "gamelist.xml" -print0 | xargs -0 sed -i 's#<image>'$HOME'/addonusb/roms/.*\/mixart#<image>./mixart#g; s#<marquee>'$HOME'/addonusb/roms/.*\/wheel#<marquee>./wheel#g; s#<video>'$HOME'/addonusb/roms/.*\/snap#<video>./snap#g'  {} 2>/dev/null \;
	sleep 1
	cd $HOME/localroms/roms
	find . -type f -name "gamelist.xml" -print0 | xargs -0 sed -i 's#<image>'$HOME'/addonusb/roms/.*\/mixart#<image>./mixart#g; s#<marquee>'$HOME'/addonusb/roms/.*\/wheel#<marquee>./wheel#g; s#<video>'$HOME'/addonusb/roms/.*\/snap#<video>./snap#g'  {} 2>/dev/null \;
	echo
	echo "[OK DONE!...]"
	sleep 1
	else
	echo "The External USB is disabled..."
	echo "Using correct path..."
    echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo
	cd $HOME/RetroPie/roms
	find . -type f -name "gamelist.xml" -print0 | xargs -0 sed -i 's#<image>'$HOME'/addonusb/roms/.*\/mixart#<image>./mixart#g; s#<marquee>'$HOME'/addonusb/roms/.*\/wheel#<marquee>./wheel#g; s#<video>'$HOME'/addonusb/roms/.*\/snap#<video>./snap#g'  {} 2>/dev/null \;
	echo
	echo "[OK DONE!...]"
	sleep 1
 fi
 }

main_menu
