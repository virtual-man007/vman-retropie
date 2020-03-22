#!/bin/sh
# all the changes neccessary to apply the updates

# change #1 n64 retroarch disable analogue fix control scheme for most games
#cp -p /opt/retropie/configs/n64/retroarch.cfg /opt/retropie/configs/n64/retroarch.cfg.VM
#cp ./opt/retropie/configs/n64/retroarch.cfg /opt/retropie/configs/n64/retroarch.cfg
# change #2 runcommand optimization
#cp -p /opt/retropie/configs/all/runcommand.cfg /opt/retropie/configs/all/runcommand.cfg.VM
#cp ./opt/retropie/configs/all/runcommand.cfg /opt/retropie/configs/all/runcommand.cfg
# change #3 emulators for specific games
#cp -p /opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg.VM
#cp ./opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg
# change #4 all retroarch global file update
#cp -p /opt/retropie/configs/all/retroarch.cfg /opt/retropie/configs/all/retroarch.cfg.VM
#cp ./opt/retropie/configs/all/retroarch.cfg /opt/retropie/configs/all/retroarch.cfg
# change #5 shaders update to use color mangler, avoid using bsnes_gamma, performance hit
#cp -p /opt/retropie/configs/all/retroarch/shaders/1arcade.glslp /opt/retropie/configs/all/retroarch/shaders/1arcade.glslp.VM
#cp ./opt/retropie/configs/all/retroarch/shaders/1arcade.glslp /opt/retropie/configs/all/retroarch/shaders/1arcade.glslp
#cp -p /opt/retropie/configs/all/retroarch/shaders/16bit.glslp /opt/retropie/configs/all/retroarch/shaders/16bit.glslp.VM
#cp ./opt/retropie/configs/all/retroarch/shaders/16bit.glslp /opt/retropie/configs/all/retroarch/shaders/16bit.glslp
# change #6 shaders preset for hanheld
#cp ./opt/retropie/configs/all/retroarch/shaders/presets/Beetle VM/ /opt/retropie/configs/all/retroarch/shaders/presets/Beetle VM/
#cp ./opt/retropie/configs/all/retroarch/shaders/presets/mGBA/ /opt/retropie/configs/all/retroarch/shaders/presets/mGBA/
# change #7 fix scummvm-residualvm to start properly
#cp ./home/pi/RetroPie/roms/scummvm/*.sh /home/pi/RetroPie/roms/scummvm/
# change #8 Xeno Crisis use of right analogue stick configuration (8bitdo SN30 Pro)
#cp -R ./opt/retropie/configs/genesis/ /opt/retropie/configs/
# change #9 custom collections updates
#cp ./opt/retropie/configs/all/emulationstation/collections/*.cfg /opt/retropie/configs/all/emulationstation/collections/

# 2020-03-08 emulators master for specific games 
cp -p /opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg.VM
cp -rf ./opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg
# 2020-03-08 pspminis change default emulator from lr-ppsspp to ppsspp
cp -p /opt/retropie/configs/pspminis/emulators.cfg /opt/retropie/configs/pspminis/emulators.cfg.VM
cp -rf ./opt/retropie/configs/pspminis/emulators.cfg /opt/retropie/configs/pspminis/emulators.cfg
# 2020-03-08 pspminis optimization-configuration for ppsspp
cp -rf ./opt/retropie/configs/psp/PSP/SYSTEM/*.ini /opt/retropie/configs/psp/PSP/SYSTEM/
# 2020-03-10 Sega Master System master configuration for core system 
cp -p /opt/retropie/configs/all/retroarch/config/Genesis Plus GX/mastersystem.cfg /opt/retropie/configs/all/retroarch/config/Genesis Plus GX/mastersystem.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/configs/Genesis Plus GX/mastersystem.cfg /opt/retropie/configs/all/retroarch/config/Genesis Plus GX/mastersystem.cfg
# 2020-03-14 PSX - Three additional games enhancements and gamelist.xml update request special VIP Sunrise169
cp -rf ./opt/retropie/configs/all/retroarch/config/PCSX-ReARMed/*.opt /opt/retropie/configs/all/retroarch/config/PCSX-ReARMed/
cp -p /home/pi/RetroPie/roms/psx/gamelist.xml /home/pi/RetroPie/roms/psx/gamelist.xml.VM
cp -rf ./home/pi/RetroPie/roms/psx/gamelist.xml /home/pi/RetroPie/roms/psx/gamelist.xml
# 2020-03-14 Amiga gamelist.xml and global vertical alignement, reported by Sunrise169
rm -f /home/pi/RetroPie/roms/amiga/NorthAndSouth_v1.7_Files_0194.lha
cp -p /home/pi/RetroPie/roms/amiga/gamelist.xml /home/pi/RetroPie/roms/amiga/gamelist.xml.VM
cp -rf ./home/pi/RetroPie/roms/amiga/gamelist.xml /home/pi/RetroPie/roms/amiga/gamelist.xml
cp -p /opt/retropie/configs/amiga/amiberry/conf/amiberry.conf /opt/retropie/configs/amiga/amiberry/conf/amiberry.conf.VM
#cp ./opt/retropie/configs/amiga/amiberry/conf/amiberry.conf /opt/retropie/configs/amiga/amiberry/conf/amiberry.conf
cp -rf ./opt/retropie/configs/amiga/amiberry/conf/default.uae /opt/retropie/configs/amiga/amiberry/conf/default.uae
# 2020-03-15 Ports Quake .sh scripts missing, 4 additional Quake games will showup now in Ports - reported by DaButcher
cp -rf ./home/pi/RetroPie/roms/ports/*.sh /home/pi/RetroPie/roms/ports/
# 2020-03-19 Ports - Quake enhancements internal resolution bumped up to 640x480 by Virtualman
cp -rf ./opt/retropie/configs/all/retroarch/config/TyrQuake/*.opt /opt/retropie/configs/all/retroarch/config/TyrQuake/
# 2020-03-21 Hide blinking cursor on boot - enhancement by 2play!
sudo cp -p ./boot/cmdline.txt /boot/cmdline.txt.VM
sudo cp -prf ./boot/cmdline.txt /boot/cmdline.txt
# 2020-03-22 Daphne - One additional game enhancements Astron Belt - request by VMAN
cp -p /home/pi/RetroPie/roms/daphne/gamelist.xml /home/pi/RetroPie/roms/daphne/gamelist.xml.VM
cp -rf ./home/pi/RetroPie/roms/daphne/gamelist.xml /home/pi/RetroPie/roms/daphne/gamelist.xml
# 2020-03-22 Arcade & Atomiswave delete known games not loading to not playable save 650MB of space - reported by VMAN
rm -f /home/pi/RetroPie/roms/arcade/cphd.zip
rm -f /home/pi/RetroPie/roms/arcade/kinst.zip
rm -f /home/pi/RetroPie/roms/arcade/kinst2.zip
rm -f /home/pi/RetroPie/roms/arcade/kinst/kinst.chd
rm -f /home/pi/RetroPie/roms/arcade/kinst/kinst2.chd
rm -f /home/pi/RetroPie/roms/atomiswave/The\ King\ of\ Fighters\ *
# 2020-03-22 Magnavox/Odyssey2/Videopac system prep retroarch friendly setup - requested by Mystical
cp -prf /opt/retropie/configs/videopac/launching.jpg /opt/retropie/configs/odyssey2/launching.jpg
cp -p /opt/retropie/configs/odyssey2/retroarch.cfg /opt/retropie/configs/odyssey2/retroarch.cfg.VM
cp -rf ./opt/retropie/configs/odyssey2/retroarch.cfg /opt/retropie/configs/odyssey2/retroarch.cfg

# 2020-03-21 force prompt/reboot - VMAN!
echo
read -n 1 -s -r -p "Press any key to continue"
sudo reboot