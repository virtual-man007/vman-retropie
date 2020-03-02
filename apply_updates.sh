#!/bin/sh
# all the changes neccessary to apply the updates

# change #1 n64 retroarch disable analogue fix control scheme for most games
cp -p /opt/retropie/configs/n64/retroarch.cfg /opt/retropie/configs/n64/retroarch.cfg.VM
cp ./opt/retropie/configs/n64/retroarch.cfg /opt/retropie/configs/n64/retroarch.cfg

# change #2 runcommand optimization
cp -p /opt/retropie/configs/all/runcommand.cfg /opt/retropie/configs/all/runcommand.cfg.VM
cp ./opt/retropie/configs/all/runcommand.cfg /opt/retropie/configs/all/runcommand.cfg

# change #3 emulators for specific games
cp -p /opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg.VM
cp ./opt/retropie/configs/all/emulators.cfg /opt/retropie/configs/all/emulators.cfg

# change #4 all retroarch global file update
cp -p /opt/retropie/configs/all/retroarch.cfg /opt/retropie/configs/all/retroarch.cfg.VM
cp ./opt/retropie/configs/all/retroarch.cfg /opt/retropie/configs/all/retroarch.cfg

# change #5 shaders update to use color mangler, avoid using bsnes_gamma, performance hit
cp -p /opt/retropie/configs/all/retroarch/shaders/1arcade.glslp /opt/retropie/configs/all/retroarch/shaders/1arcade.glslp.VM
cp ./opt/retropie/configs/all/retroarch/shaders/1arcade.glslp /opt/retropie/configs/all/retroarch/shaders/1arcade.glslp
cp -p /opt/retropie/configs/all/retroarch/shaders/16bit.glslp /opt/retropie/configs/all/retroarch/shaders/16bit.glslp.VM
cp ./opt/retropie/configs/all/retroarch/shaders/16bit.glslp /opt/retropie/configs/all/retroarch/shaders/16bit.glslp

# change #6 shaders preset for hanheld
cp ./opt/retropie/configs/all/retroarch/shaders/presets/Beetle VM/ /opt/retropie/configs/all/retroarch/shaders/presets/Beetle VM/
cp ./opt/retropie/configs/all/retroarch/shaders/presets/mGBA/ /opt/retropie/configs/all/retroarch/shaders/presets/mGBA/

# change #7 fix scummvm-residualvm to start properly
cp ./home/pi/RetroPie/roms/scummvm/*.sh /home/pi/RetroPie/roms/scummvm/

# change #8 Xeno Crisis use of right analogue stick configuration (8bitdo SN30 Pro)
cp -R ./opt/retropie/configs/genesis/ /opt/retropie/configs/

# change #9 custom collections updates
cp ./opt/retropie/configs/all/emulationstation/collections/*.cfg /opt/retropie/configs/all/emulationstation/collections/