#!/bin/bash
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
sudo reboot
fi
