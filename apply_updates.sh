#!/bin/sh
# all the changes neccessary to apply the updates

#~VMAN-1.5~ changes baked into the builds 64GB_RETRO-ARCADE-BLISS and 512GB RETRO-BLISS-REVOLUTION RELOADED
# 2020-04-01 emulators master for specific games 
#cp -p /opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg.VM
#cp -rf ./opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg
# 2020-03-08 pspminis change default emulator from lr-ppsspp to ppsspp
#cp -p /opt/retropie/configs/pspminis/emulators.cfg /opt/retropie/configs/pspminis/emulators.cfg.VM
#cp -rf ./opt/retropie/configs/pspminis/emulators.cfg /opt/retropie/configs/pspminis/emulators.cfg
# 2020-03-08 pspminis optimization-configuration for ppsspp
#cp -rf ./opt/retropie/configs/psp/PSP/SYSTEM/*.ini /opt/retropie/configs/psp/PSP/SYSTEM/
# 2020-03-10 Sega Master System master configuration for core system 
#cp -p /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/mastersystem.cfg /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/mastersystem.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/mastersystem.cfg /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/mastersystem.cfg
# 2020-03-14 PSX - additional games enhancements and gamelist.xml update request special VIP Sunrise169
#cp -rf ./opt/retropie/configs/all/retroarch/config/PCSX-ReARMed/*.opt /opt/retropie/configs/all/retroarch/config/PCSX-ReARMed/
#cp -p /home/pi/RetroPie/roms/psx/gamelist.xml /home/pi/RetroPie/roms/psx/gamelist.xml.VM
#cp -rf ./home/pi/RetroPie/roms/psx/gamelist.xml /home/pi/RetroPie/roms/psx/gamelist.xml
# 2020-03-14 Amiga gamelist.xml and global vertical alignement, reported by Sunrise169
#rm -f /home/pi/RetroPie/roms/amiga/NorthAndSouth_v1.7_Files_0194.lha
#cp -p /home/pi/RetroPie/roms/amiga/gamelist.xml /home/pi/RetroPie/roms/amiga/gamelist.xml.VM
#cp -rf ./home/pi/RetroPie/roms/amiga/gamelist.xml /home/pi/RetroPie/roms/amiga/gamelist.xml
#cp -p /opt/retropie/configs/amiga/amiberry/conf/amiberry.conf /opt/retropie/configs/amiga/amiberry/conf/amiberry.conf.VM
#cp ./opt/retropie/configs/amiga/amiberry/conf/amiberry.conf /opt/retropie/configs/amiga/amiberry/conf/amiberry.conf
#cp -rf ./opt/retropie/configs/amiga/amiberry/conf/default.uae /opt/retropie/configs/amiga/amiberry/conf/default.uae
# 2020-03-27 Ports Quake/OpenJazz .sh, 4 additional Quake and Jazz Jackrabbit games will showup now in Ports - reported by DaButcher/VMAN
#cp -rf ./home/pi/RetroPie/roms/ports/*.sh /home/pi/RetroPie/roms/ports/
#chmod +xrw /home/pi/RetroPie/roms/ports/Jazz Jackrabbit.sh
# 2020-03-19 Ports - Quake enhancements internal resolution bumped up to 640x480 by Virtualman
#cp -rf ./opt/retropie/configs/all/retroarch/config/TyrQuake/*.opt /opt/retropie/configs/all/retroarch/config/TyrQuake/
# 2020-03-21 Hide blinking cursor on boot - enhancement by 2play!
#sudo cp ./boot/cmdline.txt /boot/cmdline.txt.VM
#sudo cp -rf ./boot/cmdline.txt /boot/cmdline.txt
# 2020-03-22 Daphne - One additional game enhancements Astron Belt - request by VMAN
#cp -p /home/pi/RetroPie/roms/daphne/gamelist.xml /home/pi/RetroPie/roms/daphne/gamelist.xml.VM
#cp -rf ./home/pi/RetroPie/roms/daphne/gamelist.xml /home/pi/RetroPie/roms/daphne/gamelist.xml
# 2020-03-22 Arcade & Atomiswave delete known games not loading to not playable save 650MB of space - reported by VMAN
#rm -f /home/pi/RetroPie/roms/arcade/cphd.zip
#rm -f /home/pi/RetroPie/roms/arcade/kinst.zip
#rm -f /home/pi/RetroPie/roms/arcade/kinst2.zip
#rm -f /home/pi/RetroPie/roms/arcade/kinst/kinst.chd
#rm -f /home/pi/RetroPie/roms/arcade/kinst/kinst2.chd
#rm -f /home/pi/RetroPie/roms/atomiswave/The\ King\ of\ Fighters\ *
# 2020-03-22 Magnavox/Odyssey2/Videopac system prep retroarch friendly setup - requested by Mystical
#cp -prf /opt/retropie/configs/videopac/launching.jpg /opt/retropie/configs/odyssey2/launching.jpg
#cp -p /opt/retropie/configs/odyssey2/retroarch.cfg /opt/retropie/configs/odyssey2/retroarch.cfg.VM
#cp -rf ./opt/retropie/configs/odyssey2/retroarch.cfg /opt/retropie/configs/odyssey2/retroarch.cfg
# 2020-03-27 Nintendo System emulator configuration disabled savestate_auto - reported by Timecop80s
#cp -p /opt/retropie/configs/all/retroarch/config/FCEUmm/nes.cfg /opt/retropie/configs/all/retroarch/config/FCEUmm/nes.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/FCEUmm/nes.cfg /opt/retropie/configs/all/retroarch/config/FCEUmm/nes.cfg
# 2020-03-27 Ports - Added support for Jazz JackRabbit OpenJAZZ complete with config/gamelist/artwork "no-rom" - special request by VMAN
#cp -p /home/pi/RetroPie/roms/ports/gamelist.xml /home/pi/RetroPie/roms/ports/gamelist.xml.VM
#cp -rf ./home/pi/RetroPie/roms/ports/gamelist.xml /home/pi/RetroPie/roms/ports/gamelist.xml
#cp -rf ./opt/retropie/configs/ports/openjazz/ /opt/retropie/configs/ports/
#cp -rf ./home/pi/RetroPie/roms/ports/mixart/ /home/pi/RetroPie/roms/ports/
#cp -rf ./home/pi/RetroPie/roms/ports/snap/ /home/pi/RetroPie/roms/ports/
#cp -rf ./home/pi/RetroPie/roms/ports/wheel/ /home/pi/RetroPie/roms/ports/
#cp -p /home/pi/.livewire.py /home/pi/.livewire.py.VM
#cp -rf ./home/pi/.livewire.py /home/pi/.livewire.py
#cp -rf ./home/pi/.livewire.py /home/pi/RetroPie/extras+/.pb-fixes/bgm/.livewire.py
# 2020-03-29 N64 - Minor gamelist.xml fix Resident Evil 2 was listed as Biohazard 2 - reported by tjmadden83
#cp -p /home/pi/RetroPie/roms/n64/gamelist.xml /home/pi/RetroPie/roms/n64/gamelist.xml.VM
#cp -rf ./home/pi/RetroPie/roms/n64/gamelist.xml /home/pi/RetroPie/roms/n64/gamelist.xml
# 2020-03-29 - 4KTV only fix for hand-held systems custom aspect ratio to align with bezel properly. Retroarch video_fullscreen must be set to "true" - Reported by @pappis1985 & @Sunrise169
#cp -p /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/gamegear.cfg /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/gamegear.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/gamegear.cfg /opt/retropie/configs/all/retroarch/config/Genesis\ Plus\ GX/gamegear.cfg
#cp -p /opt/retropie/configs/all/retroarch/config/mGBA/gb.cfg /opt/retropie/configs/all/retroarch/config/mGBA/gb.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/mGBA/gb.cfg /opt/retropie/configs/all/retroarch/config/mGBA/gb.cfg
#cp -p /opt/retropie/configs/all/retroarch/config/mGBA/gbc.cfg /opt/retropie/configs/all/retroarch/config/mGBA/gbc.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/mGBA/gbc.cfg /opt/retropie/configs/all/retroarch/config/mGBA/gbc.cfg
#cp -p /opt/retropie/configs/all/retroarch/config/Beetle\ NeoPop/ngpc.cfg /opt/retropie/configs/all/retroarch/config/Beetle\ NeoPop/ngpc.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/Beetle\ NeoPop/ngpc.cfg /opt/retropie/configs/all/retroarch/config/Beetle\ NeoPop/ngpc.cfg
#cp -p /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg
#cp -p /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg /opt/retropie/configs/all/retroarch/config/VecX/vectrex.cfg
#cp -p /opt/retropie/configs/all/retroarch/config/PPSSPP/PPSSPP.cfg /opt/retropie/configs/all/retroarch/config/PPSSPP/PPSSPP.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/PPSSPP/PPSSPP.cfg /opt/retropie/configs/all/retroarch/config/PPSSPP/PPSSPP.cfg
#cp -p /opt/retropie/configs/all/retroarch/config/PPSSPP/pspminis.cfg /opt/retropie/configs/all/retroarch/config/PPSSPP/pspminis.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/PPSSPP/pspminis.cfg /opt/retropie/configs/all/retroarch/config/PPSSPP/pspminis.cfg
#cp -p /opt/retropie/configs/all/retroarch/config/Beetle\ VB/virtualboy.cfg /opt/retropie/configs/all/retroarch/config/Beetle\ VB/virtualboy.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/Beetle\ VB/virtualboy.cfg /opt/retropie/configs/all/retroarch/config/Beetle\ VB/virtualboy.cfg
# 2020-03-30 - 4KTV TV users bios fix to force 4KTV to use 1080p 60fps vs 30fps this addresses lag for (Naomi/Atomiswave/Dreamcast) - reported by pappis1985 and enhancement by 2play!-VMAN!
#sudo cp ./boot/config.txt /boot/config.txt.VM
#sudo cp -rf ./boot/config.txt /boot/config.txt
# 2020-04-01 - 4KTV only fix for Snescd systems custom aspect ratio to align with bezel properly. - reported by @neonoodle
#cp -p /opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg /opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg /opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg
# 2020-04-01 - Galaga loading after game bootup fix - reported by @Weiserboy
#cp -p /opt/retropie/configs/all/retroarch/config/MAME\ 2003-Plus/galagamf.cfg /opt/retropie/configs/all/retroarch/config/MAME\ 2003-Plus/galagamf.cf.VM
#cp -rf ./opt/retropie/configs/all/retroarch/config/MAME\ 2003-Plus/galagamf.cfg /opt/retropie/configs/all/retroarch/config/MAME\ 2003-Plus/galagamf.cfg
#cp -rf ./opt/retropie/configs/all/retroarch/config/MAME\ 2003-Plus/galagamf.opt /opt/retropie/configs/all/retroarch/config/MAME\ 2003-Plus/galagamf.opt
# 2020-04-05 - Ports - Streets of Rage Remake proven unstable on Pi4 - Known issue since day one will save 250MB - reported by VMAN
#rm -f /home/pi/RetroPie/roms/ports/sorr/SorR.dat
#rm -f /home/pi/RetroPie/roms/ports/Streets\ of\ Rage\ Remake.sh
# 2020-04-06 Dreamcast - Minor gamelist.xml wheel art fix Virtua Tennis - reported by tjmadden83
#cp -p /home/pi/RetroPie/roms/dreamcast/gamelist.xml /home/pi/RetroPie/roms/dreamcast/gamelist.xml.VM
#cp -rf ./home/pi/RetroPie/roms/dreamcast/gamelist.xml /home/pi/RetroPie/roms/dreamcast/gamelist.xml
#cp -rf ./home/pi/RetroPie/roms/dreamcast/wheel/*.png /home/pi/RetroPie/roms/dreamcast/wheel/
# 2020-04-06 Gameboy - Minor video snaps fix - reported by VMAN
#cp -rf ./home/pi/RetroPie/roms/gb/snap/*.mp4 /home/pi/RetroPie/roms/gb/snap/
# 2020-04-07 N64 Excite Bike Full-Screen Fix - reported by djsteel and 2Play!
#cp -p ./opt/retropie/configs/all/videomodes.cfg /opt/retropie/configs/all/videomodes.cfg.VM
#cp -rf ./opt/retropie/configs/all/videomodes.cfg /opt/retropie/configs/all/videomodes.cfg

#~VMAN-2.0~ Post-changes after 1.5 release for 64GB-512GB
# 2020-04-13 N64 - Enhancement/Fix graphic glitches for some N64 games, Enable Frame Buffer required for some games. Unique .opt files optimized. Reported by @Drewster 
cp -rf ./opt/retropie/configs/all/retroarch/config/Mupen64Plus\ GLES3/*.* /opt/retropie/configs/all/retroarch/config/Mupen64Plus\ GLES3/
# 2020-04-13 emulators master for specific games
cp -p /opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg.VM
cp -rf ./opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg
# 2020-04-14 Scummvm ini update for additional supported games
cp -p ./opt/retropie/configs/scummvm/scummvm.ini /opt/retropie/configs/scummvm/scummvm.ini.VM
cp -rf ./opt/retropie/configs/scummvm/scummvm.ini /opt/retropie/configs/scummvm/scummvm.ini
# 2020-04-14 - MAME 2003 Plus retroarch cfg & bezel enhancements
cp -rf ./opt/retropie/configs/all/retroarch/config/MAME\ 2003-Plus/*.cfg /opt/retropie/configs/all/retroarch/config/MAME\ 2003-Plus/
# 2020-04-14 - PSX Star Wars: Episode 1, Jedi Power Battles random freezes and unplayable - flagged for deletion (275MB) known issue and reported by Zartheus
rm -f /home/pi/RetroPie/roms/psx/Star\ Wars\ -\ Episode\ I\ -\ Jedi\ Power\ Battle\ \(USA\).chd
# 2020-04-15 Boot splashcreen option to lower "omxvol" volume (now set to 50% lower), reported by @morbid#4803 and enhancement by @2play!
sudo cp ./opt/retropie/supplementary/splashscreen/asplashscreen.sh /opt/retropie/supplementary/splashscreen/asplashscreen.sh.VM
sudo cp -rf ./opt/retropie/supplementary/splashscreen/asplashscreen.sh /opt/retropie/supplementary/splashscreen/asplashscreen.sh
# 2020-04-15 Desktop from CLI known freeze issue fixed - Pressing F4 to exit to CLi with the command "startx" will no longer freeze to start Desktop - enhancement by @2play!
sudo cp ./etc/profile.d/10-retropie.sh /etc/profile.d/10-retropie.sh.VM
sudo cp -rf ./etc/profile.d/10-retropie.sh /etc/profile.d/10-retropie.sh
# 2020-04-17 PlayBox xinmo, USB-Extend, BGM, Samba core scripts fixes-enhancements by 2play!
#rm -R /home/pi/RetroPie/extras+/xinmo-juyao/
#cp -rf ./home/pi/RetroPie/retropiemenu/Emulation/xinmo-juyao.sh /home/pi/RetroPie/retropiemenu/Emulation/xinmo-juyao.sh
#cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Emulation/xinmo-juyao.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Emulation/xinmo-juyao.sh
#cp -rf ./opt/retropie/configs/all/autostart.sh /opt/retropie/configs/all/autostart.sh
#cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/bgm/.livewire.py /home/pi/RetroPie/extras+/.pb-fixes/bgm/.livewire.py
#cp -rf ./home/pi/.livewire.py /home/pi/.livewire.py
#cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/bgm.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/bgm.sh
#cp -rf ./home/pi/RetroPie/retropiemenu/System/bgm.sh /home/pi/RetroPie/retropiemenu/System/bgm.sh
#cp -rf ./home/pi/RetroPie/extras+/usb/10-retropie.USB /home/pi/RetroPie/extras+/usb/10-retropie.USB
#chmod +x /home/pi/RetroPie/extras+/usb/10-retropie.USB
#cp -rf ./home/pi/RetroPie/extras+/usb/smb.conf.USB /home/pi/RetroPie/extras+/usb/smb.conf.USB
#chmod +x /home/pi/RetroPie/extras+/usb/smb.conf.USB
#cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/USB/usb-ext.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/USB/usb-ext.sh
#cp -rf ./home/pi/RetroPie/extras+/usb/usb-off.sh /home/pi/RetroPie/extras+/usb/usb-off.sh
#cp -rf ./home/pi/RetroPie/extras+/usb/usb-on.sh /home/pi/RetroPie/extras+/usb/usb-on.sh

# 2020-04-13 force reboot - VMAN!
sudo reboot