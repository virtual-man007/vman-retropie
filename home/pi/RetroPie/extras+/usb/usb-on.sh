#!/bin/bash
# Script created by EazyHax to expand the roms file system to an external MSD
# Your USB mass storage device (MSD) needs to be in NTFS format.
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
else echo "External drive checks out. Correctly formatted to NTFS"
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
echo "...roms on your internal drive to the external drive. They will be located in the "roms" directory on your external drive."
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
sleep 3
echo
echo " ** Based on script by Forrest aka EazyHax on YouTube! ** "
sleep 5
echo
echo "  **   New Combo Script, Visuals & Tweaks By 2Play!   **  "
sleep 5
sudo halt
