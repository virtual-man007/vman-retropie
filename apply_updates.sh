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
cp -p /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/mastersystem.cfg /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/mastersystem.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/mastersystem.cfg /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/mastersystem.cfg
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
# 2020-03-27 Ports Quake/OpenJazz .sh, 4 additional Quake and Jazz Jackrabbit games will showup now in Ports - reported by DaButcher/VMAN
cp -rf ./home/pi/RetroPie/roms/ports/*.sh /home/pi/RetroPie/roms/ports/
#chmod +xrw /home/pi/RetroPie/roms/ports/Jazz Jackrabbit.sh
# 2020-03-19 Ports - Quake enhancements internal resolution bumped up to 640x480 by Virtualman
cp -rf ./opt/retropie/configs/all/retroarch/config/TyrQuake/*.opt /opt/retropie/configs/all/retroarch/config/TyrQuake/
# 2020-03-21 Hide blinking cursor on boot - enhancement by 2play!
sudo cp ./boot/cmdline.txt /boot/cmdline.txt.VM
sudo cp -rf ./boot/cmdline.txt /boot/cmdline.txt
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
# 2020-03-27 Nintendo System emulator configuration disabled savestate_auto - reported by Timecop80s
cp -p /opt/retropie/configs/all/retroarch/config/FCEUmm/nes.cfg /opt/retropie/configs/all/retroarch/config/FCEUmm/nes.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/FCEUmm/nes.cfg /opt/retropie/configs/all/retroarch/config/FCEUmm/nes.cfg
# 2020-03-27 Ports - Added support for Jazz JackRabbit OpenJAZZ complete with config/gamelist/artwork "no-rom" - special request by VMAN
cp -p /home/pi/RetroPie/roms/ports/gamelist.xml /home/pi/RetroPie/roms/ports/gamelist.xml.VM
cp -rf ./home/pi/RetroPie/roms/ports/gamelist.xml /home/pi/RetroPie/roms/ports/gamelist.xml
cp -rf ./opt/retropie/configs/ports/openjazz/ /opt/retropie/configs/ports/
cp -rf ./home/pi/RetroPie/roms/ports/mixart/ /home/pi/RetroPie/roms/ports/
cp -rf ./home/pi/RetroPie/roms/ports/snap/ /home/pi/RetroPie/roms/ports/
cp -rf ./home/pi/RetroPie/roms/ports/wheel/ /home/pi/RetroPie/roms/ports/
cp -p /home/pi/.livewire.py /home/pi/.livewire.py.VM
cp -rf ./home/pi/.livewire.py /home/pi/.livewire.py
cp -rf ./home/pi/.livewire.py /home/pi/RetroPie/extras+/.pb-fixes/bgm/.livewire.py
# 2020-03-29 N64 - Minor gamelist.xml fix Resident Evil 2 was listed as Biohazard 2 - reported by tjmadden83
cp -p /home/pi/RetroPie/roms/n64/gamelist.xml /home/pi/RetroPie/roms/n64/gamelist.xml.VM
cp -rf ./home/pi/RetroPie/roms/n64/gamelist.xml /home/pi/RetroPie/roms/n64/gamelist.xml
# 2020-03-29 - 4KTV only fix for hand-held systems custom aspect ratio to align with bezel properly. Retroarch video_fullscreen must be set to "true" - Reported by @pappis1985 & @Sunrise169
cp -p /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/gamegear.cfg /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/gamegear.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/gamegear.cfg /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/gamegear.cfg
cp -p /opt/retropie/configs/all/retroarch/config/mGBA/gb.cfg /opt/retropie/configs/all/retroarch/config/mGBA/gb.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/mGBA/gb.cfg /opt/retropie/configs/all/retroarch/config/mGBA/gb.cfg
cp -p /opt/retropie/configs/all/retroarch/config/mGBA/gbc.cfg /opt/retropie/configs/all/retroarch/config/mGBA/gbc.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/mGBA/gbc.cfg /opt/retropie/configs/all/retroarch/config/mGBA/gbc.cfg
cp -p /opt/retropie/configs/all/retroarch/config/Beetle\ NeoPop/ngpc.cfg /opt/retropie/configs/all/retroarch/config/Beetle\ NeoPop/ngpc.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/Beetle\ NeoPop/ngpc.cfg /opt/retropie/configs/all/retroarch/config/Beetle\ NeoPop/ngpc.cfg
cp -p /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg
cp -p /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg
cp -p /opt/retropie/configs/all/retroarch/config/PPSSPP/PPSSPP.cfg /opt/retropie/configs/all/retroarch/config/PPSSPP/PPSSPP.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/PPSSPP/PPSSPP.cfg /opt/retropie/configs/all/retroarch/config/PPSSPP/PPSSPP.cfg
cp -p /opt/retropie/configs/all/retroarch/config/PPSSPP/pspminis.cfg /opt/retropie/configs/all/retroarch/config/PPSSPP/pspminis.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/PPSSPP/pspminis.cfg /opt/retropie/configs/all/retroarch/config/PPSSPP/pspminis.cfg
cp -p /opt/retropie/configs/all/retroarch/config/Beetle\ VB/virtualboy.cfg /opt/retropie/configs/all/retroarch/config/Beetle\ VB/virtualboy.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/Beetle\ VB/virtualboy.cfg /opt/retropie/configs/all/retroarch/config/Beetle\ VB/virtualboy.cfg
# 2020-03-30 - 4KTV TV users bios fix to force 4KTV to use 1080p 60fps vs 30fps this addresses lag for (Naomi/Atomiswave/Dreamcast) - reported by pappis1985 and enhancement by 2play!-VMAN!
sudo cp ./boot/config.txt /boot/config.txt.VM
sudo cp -rf ./boot/config.txt /boot/config.txt
# 2020-04-01 - 4KTV only fix for Snescd systems custom aspect ratio to align with bezel properly. - reported by @neonoodle
cp -p /opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg /opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg /opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg

# 2020-03-21 force prompt/reboot - VMAN!
#echo
#read -n 1 -s -r -p "Press any key to continue"
sudo reboot