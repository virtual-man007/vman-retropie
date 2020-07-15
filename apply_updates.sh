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
# 2020-07-03 PlayBox xinmo, USB-Extend, BGM, Samba core scripts fixes-enhancements by 2play!
rm -R -f /home/pi/RetroPie/extras+/xinmo-juyao
cp -rf ./home/pi/RetroPie/retropiemenu/Emulation/xinmo-juyao.sh /home/pi/RetroPie/retropiemenu/Emulation/xinmo-juyao.sh
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Emulation/xinmo-juyao.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/Emulation/xinmo-juyao.sh
cp -rf ./opt/retropie/configs/all/autostart.sh /opt/retropie/configs/all/autostart.sh
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/bgm/.livewire.py /home/pi/RetroPie/extras+/.pb-fixes/bgm/.livewire.py
cp -rf ./home/pi/.livewire.py /home/pi/.livewire.py
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/bgm.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/bgm.sh
cp -rf ./home/pi/RetroPie/retropiemenu/System/bgm.sh /home/pi/RetroPie/retropiemenu/System/bgm.sh
cp -rf ./home/pi/RetroPie/extras+/usb/10-retropie.sh.USB /home/pi/RetroPie/extras+/usb/10-retropie.sh.USB
chmod +x /home/pi/RetroPie/extras+/usb/10-retropie.sh.USB
cp -rf ./home/pi/RetroPie/extras+/usb/smb.conf.USB /home/pi/RetroPie/extras+/usb/smb.conf.USB
chmod +x /home/pi/RetroPie/extras+/usb/smb.conf.USB
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/USB/usb-ext.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/USB/usb-ext.sh
cp -rf ./home/pi/RetroPie/extras+/usb/usb-off.sh /home/pi/RetroPie/extras+/usb/usb-off.sh
cp -rf ./home/pi/RetroPie/extras+/usb/usb-on.sh /home/pi/RetroPie/extras+/usb/usb-on.sh
# 2020-07-13 fixplaybox toolkit update - Fix retropiemenu (option 1) without exiting to CLi. As on PlayBox v2 -Latest PlayBox Toolkit with updates and new option to force a filesystem - by 2play!
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/fixplaybox.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/fixplaybox.sh
cp -rf ./home/pi/RetroPie/retropiemenu/fixplaybox.sh /home/pi/RetroPie/retropiemenu/fixplaybox.sh
chmod +x /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/fixplaybox.sh
chmod +x /home/pi/RetroPie/retropiemenu/fixplaybox.sh
# 2020-04-18 Playbox Region Systems Fixed EU Regions - reported by austin
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/es_cfg/*.cfg /home/pi/RetroPie/extras+/.pb-fixes/es_cfg/
# 2020-04-18 fixplaybox Playbox new omxvol script - by 2play!
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/_scripts/omxvol.sh /home/pi/RetroPie/extras+/.pb-fixes/_scripts/omxvol.sh
chmod +x /home/pi/RetroPie/extras+/.pb-fixes/_scripts/omxvol.sh
# 2020-04-18 53 Custom Collections enhancement/fixes - by Zartheus
cp -rf ./opt/retropie/configs/all/emulationstation/collections/*.cfg /opt/retropie/configs/all/emulationstation/collections/
# 2020-04-22 omxplayer /usr/bin replaced - by 2play!
sudo cp ./usr/bin/omxplayer /usr/bin/omxplayer.VM
sudo cp -rf ./usr/bin/omxplayer /usr/bin/omxplayer
# 2020-06-13 emulators master for specific games
cp -p /opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg.VM
cp -rf ./opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg
# 2020-05-10 - lr-flycast Dreamcast/Atomiswave retroarch cfg update-prep for addon, .opt files no longer needed
cp -rf ./opt/retropie/configs/all/retroarch/config/Flycast/*.cfg /opt/retropie/configs/all/retroarch/config/Flycast/
rm -f /opt/retropie/configs/all/retroarch/config/Flycast/*.opt
# 2020-04-28 - Atomiswave retroarch cfg update-prep for addon
cp -p ./opt/retropie/configs/atomiswave/retroarch.cfg /opt/retropie/configs/atomiswave/retroarch.cfg.VM
cp -rf ./opt/retropie/configs/atomiswave/retroarch.cfg /opt/retropie/configs/atomiswave/retroarch.cfg
# 2020-04-29 - emulationstation themes permission fix so files can easily be overwritten via samba share
sudo chown pi:pi -R /etc/emulationstation/themes/
# 2020-05-29 lr-vice Commodore 64 retroarch fix/optimization for keyboard-controller options to work with new emulator - reported by @sunrise169
cp -rf ./opt/retropie/configs/all/retroarch/config/VICE\ x64/*.cfg /opt/retropie/configs/all/retroarch/config/VICE\ x64/
cp -rf ./opt/retropie/configs/c64/*.cfg /opt/retropie/configs/c64/
# 2020-05-03 - PPSSPP ini optimized game configs for PlayStation Portable - More to come!!
cp -rf ./opt/retropie/configs/psp/PSP/SYSTEM/*.ini /opt/retropie/configs/psp/PSP/SYSTEM/
# 2020-05-05 - Atomiswave/Naomi delete cached <game>.nvmem* fixes stuck at bios for certain games - reported by @acsalazar9 
rm -rf /home/pi/RetroPie/saves/atomiswave/reicast/*.*
rm -rf /home/pi/RetroPie/saves/naomi/reicast/*.*
# 2020-05-10 Nintendo 64 emulators.cfg update mupen64plus-gles2rice to use 1920x1080 - reported by @GeekOB
cp -p /opt/retropie/configs/n64/emulators.cfg /opt/retropie/configs/n64/emulators.cfg.VM
cp -rf ./opt/retropie/configs/n64/emulators.cfg /opt/retropie/configs/n64/emulators.cfg
# 2020-06-15 3DO Retroarch prep for addon bundle and lr-opera emulator
cp -p /opt/retropie/configs/3do/emulators.cfg /opt/retropie/configs/3do/emulators.cfg.VM
cp -rf ./opt/retropie/configs/3do/emulators.cfg /opt/retropie/configs/3do/emulators.cfg
cp -rf ./opt/retropie/configs/all/retroarch/config/Opera/ /opt/retropie/configs/all/retroarch/config/
# 2020-05-17 SNES-MSU1 retroarch Snes9x config fix-prep for future addon
cp -p /opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg /opt/retropie/configs/all/retroarch/config/Snes9x/snescd.cfg.VM
cp -rf ./opt/retropie/configs/all/retroarch/config/Snes9x/*.cfg /opt/retropie/configs/all/retroarch/config/Snes9x/
# 2020-05-25 3DO updated enhanced Panasonic-3DO.png bezel
cp -rf ./opt/retropie/configs/all/retroarch/overlay/borders/Panasonic-3DO.png /opt/retropie/configs/all/retroarch/overlay/borders/Panasonic-3DO.png
# 2020-05-29 retroarch master options file
cp -p /opt/retropie/configs/all/retroarch-core-options.cfg /opt/retropie/configs/all/retroarch-core-options.VM
cp -rf ./opt/retropie/configs/all/retroarch-core-options.cfg /opt/retropie/configs/all/retroarch-core-options.cfg
# 2020-05-30 fixplaybox oc.sh update - by 2play!
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/oc.sh /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/oc.sh
cp -rf ./home/pi/RetroPie/retropiemenu/System/oc.sh /home/pi/RetroPie/retropiemenu/System/oc.sh
chmod +x /home/pi/RetroPie/extras+/.pb-fixes/retropiemenu/System/oc.sh
chmod +x /home/pi/RetroPie/retropiemenu/System/oc.sh
# 2020-05-31 - SNESCD retroarch cfg update fixed save state - repoted by @crashbang
cp -p ./opt/retropie/configs/snescd/retroarch.cfg /opt/retropie/configs/snescd/retroarch.cfg.VM
cp -rf ./opt/retropie/configs/snescd/retroarch.cfg /opt/retropie/configs/snescd/retroarch.cfg
# 2020-06-02 C64 - Enhancement/Fix for certain game options. Unique .opt files optimized. Reported by @sunrise169 
cp -rf ./opt/retropie/configs/all/retroarch/config/VICE\ x64/*.opt /opt/retropie/configs/all/retroarch/config/VICE\ x64/
# 2020-06-13 Arcade retroarch prep for addon bundle bezel/emulators optimization
cp -rf ./opt/retropie/configs/all/retroarch/config/MAME\ 2010/*.* /opt/retropie/configs/all/retroarch/config/MAME\ 2010/
cp -rf ./opt/retropie/configs/all/retroarch/config/MAME\ 2016/*.* /opt/retropie/configs/all/retroarch/config/MAME\ 2016/
cp -rf ./opt/retropie/configs/all/retroarch/config/FinalBurn\ Neo/*.* /opt/retropie/configs/all/retroarch/config/FinalBurn\ Neo/
cp -rf ./opt/retropie/configs/all/retroarch/config/MAME/*.* /opt/retropie/configs/all/retroarch/config/MAME/
# 2020-06-28 Updated PlayBox USB-Extend core scripts fixes-enhancements (supports these ART folders/tags (skraper, VirtualMan...) by 2play!
cp -rf ./home/pi/RetroPie/retropiemenu/System/USB/usb-ext.sh /home/pi/RetroPie/retropiemenu/System/USB/usb-ext.sh
chmod +x /home/pi/RetroPie/retropiemenu/System/USB/usb-ext.sh
# 2020 kinst optimization must change rom as per instructions
# 2020-07-06 Playbox gamelist-autoclean script updated fix bug - by 2play!
cp -rf ./home/pi/RetroPie/extras+/.pb-fixes/_scripts/gamelist-autoclean.sh /home/pi/RetroPie/extras+/.pb-fixes/_scripts/gamelist-autoclean.sh
chmod +x /home/pi/RetroPie/extras+/.pb-fixes/_scripts/gamelist-autoclean.sh

# 2020-04-29 sleep and force reboot - VMAN!
sleep 10
sudo reboot
