#!/bin/bash
# USB External Script by 2Play Based on Eazy Hax USB Script!
# The PlayBox Project
# Copyright (C)2018-2020 2Play! (S.R.)
# 13.07.20

infobox=""
infobox="${infobox}\n"
infobox="${infobox}It allows you to enable the EZH - USB Extra ROMs NTFS drive or remove when you are planning to install a new one or just remove it!\nWithout it, just the SD ROMs Setup will be used.\n\n"
infobox="${infobox}**ENABLE OPTION - README**\n- The connected USB drive will be used to store extra ROMs.\n- IF you WANT your ART folders also on USB then you need to edit the XML for that specific folder you have ART also on USB."
infobox="${infobox}\n\n"
infobox="${infobox}**DISABLE OPTION - README**\n- The USB configuration will be removed and you can install a new drive or use only the ROMs on your SD.\n- IF you have CHANGED any XML then to you need revert back to original setup.\n\n"
infobox="${infobox}Original scipts ON/OFF by EZH aka Forrest. Combined and updated by 2Play!\n"
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
            - "*** ART,XML OPTIONS - EXTERNAL USB ENABLED ***" \
            3 " - I have ADD-ONS Related ROMs, ART Folders & XML on USB " \
			4 " - I want to restore a single USB ADD-ON XML to Default" \
			- "" \
			- "*** RESTORE ALL XML - ART TO DEFAULT ***" \
			5 " - I have ALL on SD or Restore any changes on USB XML" \
			- "" \
			- "*** MOVE A SYSTEM SELECTIONS ***" \
            6 " - I want to move a SYSTEM from SD => Ext. USB" \
			7 " - I want to move a SYSTEM from Ext. USB => SD" \
			2>&1 > /dev/tty)

        case "$choice" in
            1) enable_usb  ;;
            2) disable_usb  ;;
            3) addon_art_usb  ;;
			4) addon_art_def  ;;
			5) all_sd  ;;
            6) sys_usb  ;;
			7) sys_sd  ;;
			-) none  ;;
            *)  break ;;
        esac
    done
	clear
}


function enable_usb() {
dialog --infobox "...Applying..." 3 20 ; sleep 2
# Script created by EazyHax to expand the roms file system to an external MSD
# Your USB mass storage device (MSD) needs to be in NTFS format.
# v20.06.2020
clear
echo "STEP 1: Checking For External Drive..."
sleep 3
testdrive=`df |grep media |awk '{print $1 }'|wc -l`
if [ $testdrive -eq 0 ] ; then
echo "No External drive detected. Exiting."
sleep 5
exit
else
echo "External Drive detected"
echo
echo "STEP 2: Performing checks for NTFS filesystem."
sleep 5
fi

EXTDR=`sudo blkid |grep -v mmc|grep ntfs`
usb_mount=`echo $EXTDR|awk '{print $1 }'|tr -d :`
usb_filesystem=`echo $EXTDR |grep -Po 'TYPE="\K.*?(?=")'`
usb_uuid=`blkid -o value -s UUID $usb_mount`

if [ "$usb_filesystem" != "ntfs" ] ; then
echo "This external drive is not correctly formatted. It must be formatted using the NTFS filesystem. Please reformat it to NTFS."
echo "Fat vfat exfat filesystems are not supported"
sleep 10; exit
else
echo "External drive checks out. Correctly formatted to NTFS"
sleep 5
fi

sudo grep -w UUID /etc/fstab |grep -v ext4 > /dev/null 2>&1
if [ $? -eq 0 ] ; then
echo "It seems you already have an external drive mapped. Only one external drive is supported. Please run the "USB Roms On/Off, EZH-2P!" script again, disable other drive before adding a new drive."
sleep 10
exit
else
mkdir $HOME/addonusb > /dev/null 2>&1
echo "UUID=$usb_uuid  $HOME/addonusb      $usb_filesystem    nofail,user,umask=0000  0       2" > $HOME/.currentdrive
sudo sh -c "cat $HOME/.currentdrive >> /etc/fstab"
sudo umount $usb_mount
sudo mount -a
fi
testdrive2=`df |grep addonusb|wc -l`
if [ $testdrive2 -eq 0 ] ; then
	echo -e "Something went wrong. Unable to detect that external drive mounted correctly. Exiting...."
	sleep 5
	exit
fi

sleep 3
mkdir $HOME/addonusb/roms/
mkdir $HOME/RetroPie/combined_drives
mkdir $HOME/.work
echo
echo "STEP 3: Syncing the roms directories."
sleep 3
echo "...roms directories to the external drive. They will be located in the "roms" directory on your external drive."
sleep 3
sudo chmod 777  $HOME/addonusb
find "$HOME/RetroPie/roms" -mindepth 1 -maxdepth 1 -type d -printf "$HOME/addonusb/roms/%f\n" | xargs mkdir -p 2>/dev/null || true
sleep 1
mv $HOME/RetroPie/roms $HOME/RetroPie/localroms
cd /etc/samba/
sudo cp /home/pi/RetroPie/extras+/usb/smb.conf.USB ./
sudo mv smb.conf smb.conf.BAK
sudo ln -s smb.conf.USB smb.conf
cd /etc/profile.d
sudo cp /home/pi/RetroPie/extras+/usb/10-retropie.sh.USB ./
sudo mv /etc/profile.d/10-retropie.sh /etc/profile.d/10-retropie.sh.BAK
sudo ln -s 10-retropie.sh.USB 10-retropie.sh
sed -i 's+/home/pi/RetroPie/roms+/home/pi/RetroPie/localroms+g' ~/.livewire.py
echo
echo "STEP 4: Finalizing..."
sleep 3
echo -e 'The drive has been expanded and your system will now halt/shutdown.\nDetach your external drive... Plug it up to your computer. Load/copy your extra roms then plug it back in your pi and restart it... You should see your additional games.'
echo "You also have the option of uploading games by using windows file explorer and the network path."
echo "Or use the new move scripts..."
echo
read -n 1 -s -r -p "Press any key to continue..."
echo
echo " ** Based on script by Forrest aka EazyHax on YouTube! ** "
sleep 3
echo
echo "  **   New Script, Visuals & Tweaks By 2Play!   **  "
sleep 3
clear
echo
read -n 1 -s -r -p "Press any key to Power Off System"
echo
clear
echo "[OK System Will Shutdown now...]"
clear
sudo halt
}

function disable_usb() {
dialog --infobox "...Applying..." 3 20 ; sleep 2
 clear
echo "STEP 1: Checking For External Drive..."
sleep 3
if [ ! -d $HOME/addonusb ]; then
    echo ""
    echo ""
	sleep 3
	echo "This Retropie is not expanded. Stopping now..."
    echo ""
    echo ""
    sleep 5
else
echo "External Drive Detected..."
sleep 3
echo
echo "STEP 2: Removing External Drive..."
sleep 3

sudo sed -i '/addon/d' /etc/fstab
sudo unlink /etc/profile.d/10-retropie.sh
sudo cp /etc/profile.d/10-retropie.sh.BAK /etc/profile.d/10-retropie.sh
sudo unlink /etc/samba/smb.conf
sudo cp /etc/samba/smb.conf.BAK /etc/samba/smb.conf
sudo /usr/sbin/service smbd stop
unlink $HOME/RetroPie/roms; sudo umount $HOME/addonusb; sudo umount overlay
while [ `df |grep overlay |awk '{print $1 }'|wc -l` -eq 1 ]; do
            echo -e "\n\nOverlay Mount is still present. Waiting a few seconds and will try to dismout the drive again.\n\n"
            sleep 10
            sudo umount overlay
done
echo
echo "STEP 3: Finalizing..."
sleep 3
echo -e '\nCombined drives have been unmounted. Moving on with cleaning up directories and restoring your retro rig.\n[OK!] Rebooting Now...\n'
sleep 10
sed -i 's+/home/pi/RetroPie/localroms+/home/pi/RetroPie/roms+g' ~/.livewire.py
rm -r $HOME/RetroPie/combined_drives; rm -r $HOME/addonusb; rm -rf $HOME/.work; mv $HOME/RetroPie/localroms $HOME/RetroPie/roms  > /dev/null 2>&1
clear
echo
read -n 1 -s -r -p "Press any key to reboot"
echo
echo "[OK System Will Restart now...]"
clear
sudo reboot
fi
}

function addon_art_usb() {
dialog --infobox "...OK Let's Do It..." 3 25 ; sleep 1
clear
if [ -d $HOME/addonusb ]; then cd $HOME/addonusb/roms
	echo 
	echo " I will display a list of all USB Rom folders..."
	echo " If you can't see full list. Use below keys to scroll or exit list!"
	echo
	echo "----------------------------------------------------------------------"
	echo " <space>	Display next k lines of text [current screen size]"
	echo " <return>	Display next k lines of text [1]*"
	echo " d		Scroll k lines [current scroll size, initially 11]*"
	echo " q		Exit from more"
	echo "----------------------------------------------------------------------"
	echo
	echo "***PLEASE TYPE THE SYSTEM NAME AS IS IN THE ROMS LIST***"
	echo 
	echo "Example: arcade"
	echo "NOT Arcade or ARCADE etc..."
	echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo
	ls | column | more -d
	echo
	read -n 1 -s -r -p "*** PRESS ANY KEY TO CONTINUE -OR- PRESS CTRL + C TO EXIT ***"
	echo
	echo
	read -p 'So which system would you like to update: ' sname
	echo
	cd $sname
	mv gamelist.xml $HOME/RetroPie/localroms/$sname
	cd $HOME/RetroPie/localroms/$sname
		if grep 'addonusb' gamelist.xml > /dev/null; then
		echo
		echo "Your gamelist.xml already points to USB Art!"
		echo
		else
		sed -i 's#<image>.#<image>'$HOME'/addonusb/roms/'$sname'#g; s#<marquee>.#<marquee>'$HOME'/addonusb/roms/'$sname'#g; s#<video>.#<video>'$HOME'/addonusb/roms/'$sname'#g' gamelist.xml > /dev/null
		fi
	echo
	echo "[OK DONE!...]"
	sleep 1
	else
	echo "The External USB is disabled... Nothing to do!"
	echo
	read -n 1 -s -r -p "Press any key to go back..."
	echo
	break
fi
}

function addon_art_def() {
dialog --infobox "...OK Let's Do It..." 3 25 ; sleep 1
clear
if [ -d $HOME/addonusb ]; then cd $HOME/addonusb/roms
	echo 
	echo " I will display a list of all USB Rom folders..."
	echo " If you can't see full list. Use below keys to scroll or exit list!"
	echo
	echo "----------------------------------------------------------------------"
	echo " <space>	Display next k lines of text [current screen size]"
	echo " <return>	Display next k lines of text [1]*"
	echo " d		Scroll k lines [current scroll size, initially 11]*"
	echo " q		Exit from more"
	echo "----------------------------------------------------------------------"
	echo
	echo "*** PLEASE TYPE THE SYSTEM NAME AS IS IN THE ROMS LIST ***"
	echo 
	echo "Example: arcade"
	echo "NOT Arcade or ARCADE etc..."
	echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo
	ls | column | more -d
	echo
	read -n 1 -s -r -p "*** PRESS ANY KEY TO CONTINUE -OR- PRESS CTRL + C TO EXIT ***"
	echo
	echo
	read -p 'So which system would you like to update: ' sname
	echo
	cd $sname
	mv gamelist.xml $HOME/RetroPie/localroms/$sname
	cd $HOME/RetroPie/localroms/$sname
	sed -i 's#<image>'$HOME'/addonusb/roms/.*\/mixart#<image>./mixart#g; s#<marquee>'$HOME'/addonusb/roms/.*\/wheel#<marquee>./wheel#g; s#<video>'$HOME'/addonusb/roms/.*\/snap#<video>./snap#g' gamelist.xml > /dev/null
	echo
	echo "[OK DONE!...]"
	sleep 1
	else
	echo "The External USB is disabled... Nothing to do!"
	echo
	read -n 1 -s -r -p "Press any key to go back..."
	echo
	break
fi
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
	cd $HOME/RetroPie/localroms
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

function sys_usb() {
dialog --infobox "...OK Let's Do It..." 3 25 ; sleep 1
 clear
 if [ -d $HOME/addonusb ]; then cd $HOME/RetroPie/localroms
	echo
    echo "The External USB is enabled..."
	echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo 
	echo " I will display a list of all USB Rom folders..."
	echo " If you can't see full list. Use below keys to scroll or exit list!"
	echo
	echo "----------------------------------------------------------------------"
	echo " <space>	Display next k lines of text [current screen size]"
	echo " <return>	Display next k lines of text [1]*"
	echo " d		Scroll k lines [current scroll size, initially 11]*"
	echo " q		Exit from more"
	echo "----------------------------------------------------------------------"
	echo
	echo "*** PLEASE TYPE THE SYSTEM NAME AS IS IN THE ROMS LIST ***"
	echo 
	echo "Example: arcade"
	echo "NOT Arcade or ARCADE etc..."
	echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo
	ls | column | more -d
	echo
	read -n 1 -s -r -p "*** PRESS ANY KEY TO CONTINUE -OR- PRESS CTRL + C TO EXIT ***"
	echo
	echo
	read -p 'So which system would you like to update: ' sname
	echo
	cd $sname
	sudo rsync --remove-source-files -avh ./ $HOME/addonusb/roms/$sname/
	echo
	echo "[OK DONE!...]"
	sleep 1
	else
	echo "The External USB is disabled... Nothing to do!"
	echo
	read -n 1 -s -r -p "Press any key to go back..."
	echo
	break
fi
}

function sys_sd() {
dialog --infobox "...OK Let's Do It..." 3 25 ; sleep 1
clear
 if [ -d $HOME/addonusb ]; then cd $HOME/addonusb/roms
	echo
    echo "The External USB is enabled..."
	echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo 
	echo " I will display a list of all USB Rom folders..."
	echo " If you can't see full list. Use below keys to scroll or exit list!"
	echo
	echo "----------------------------------------------------------------------"
	echo " <space>	Display next k lines of text [current screen size]"
	echo " <return>	Display next k lines of text [1]*"
	echo " d		Scroll k lines [current scroll size, initially 11]*"
	echo " q		Exit from more"
	echo "----------------------------------------------------------------------"
	echo
	echo "*** PLEASE TYPE THE SYSTEM NAME AS IS IN THE ROMS LIST ***"
	echo 
	echo "Example: arcade"
	echo "NOT Arcade or ARCADE etc..."
	echo
	read -n 1 -s -r -p "Press any key to continue..."
	echo
	ls | column | more -d
	echo
	read -n 1 -s -r -p "*** PRESS ANY KEY TO CONTINUE -OR- PRESS CTRL + C TO EXIT ***"
	echo
	echo
	read -p 'So which system would you like to update: ' sname
	echo
	cd $sname
	rsync --remove-source-files -rvh ./ $HOME/RetroPie/localroms/$sname/
	cd $HOME/RetroPie/localroms/$sname/
	find ./ -type d -print0 | xargs -0 chmod 755
	find ./ -type f -print0 | xargs -0 chmod 644
	chmod 755 *.sh && chmod 755 *.exe  && chmod 755 *.com && chmod 755 *.bat
	echo
	echo "[OK DONE!...]"
	sleep 1
	else
	echo "The External USB is disabled... Nothing to do!"
	echo
	read -n 1 -s -r -p "Press any key to go back..."
	echo
	break
fi
}

main_menu
