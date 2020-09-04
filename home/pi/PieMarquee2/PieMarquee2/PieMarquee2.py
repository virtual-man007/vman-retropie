#!/usr/bin/python

import os
from subprocess import *
from time import *
import xml.etree.ElementTree as ET

INTRO = "/home/pi/PieMarquee2/intro2.mp4"
## for DPI screen
#VIEWER = "/opt/retropie/configs/all/PieMarquee2/omxiv-marquee /tmp/marquee.txt -f -d 4 -t 5 -T blend --duration 900 > /dev/null 2>&1 &"
## for Pi4 hdmi1
VIEWER = "/opt/retropie/configs/all/PieMarquee2/omxiv-marquee /tmp/marquee.txt -f -d 7 -t 5 -T blend --duration 900 > /dev/null 2>&1 &"

arcade = ['arcade', 'fba', 'mame-advmame', 'mame-libretro', 'mame-mame4all', 'neogeo', 'neogeocd', 'naomi', 'atomiswave', 'daphne']

def run_cmd(cmd):
# runs whatever in the cmd variable
    p = Popen(cmd, shell=True, stdout=PIPE)
    output = p.communicate()[0]
    return output

def kill_proc(name):
    ps_grep = run_cmd("ps -aux | grep " + name + "| grep -v 'grep'")
    if len(ps_grep) > 1: 
        os.system("killall " + name)
        
def is_running(pname):
    ps_grep = run_cmd("ps -ef | grep " + pname + " | grep -v grep")
    if len(ps_grep) > 1:
        return True
    else:
        return False

def get_publisher(romname):
    filename = romname+".zip"
    publisher = ""
    for item in root:
        if filename in item.findtext('path'):
            publisher = item.findtext('publisher')
            break
    if publisher == "":
        return ""
    words = publisher.split()
    return words[0].lower()
    
if os.path.isfile(INTRO) == True:
    ## for DPI screen
    #run_cmd("omxplayer --display 4 " + INTRO)
    ## for Pi4 hdmi1
    run_cmd("omxplayer --display 7 " + INTRO)

doc = ET.parse("/home/pi/PieMarquee2/PieMarquee2/gamelist_short.xml")
root = doc.getroot()

os.system("echo '/home/pi/PieMarquee2/marquee/system/maintitle2.png' > /tmp/marquee.txt")
os.system(VIEWER)
    
cur_imgname = "system/maintitle"
while True:
    sleep_interval = 1
    ingame = ""
    romname = ""
    sysname = ""
    pubpath = ""
    instpath = ""
    imgpath = ""
    ps_grep = run_cmd("ps -aux | grep emulators | grep -v 'grep'")
    if len(ps_grep) > 1:
        ingame="*"
        words = ps_grep.split()
        if 'advmame' in ps_grep:
            sysname = "arcade"
            romname = words[-1]
        else:
            pid = words[1]
            if os.path.isfile("/proc/"+pid+"/cmdline") == False:
                continue
            path = run_cmd("strings -n 1 /proc/"+pid+"/cmdline | grep roms")
            if len(path.replace('"','').split("/")) < 2:
                continue
            sysname = path.replace('"','').split("/")[-2]
            if sysname in arcade:
                sysname = "arcade"
            romname = path.replace('"','').split("/")[-1].split(".")[0]

    elif os.path.isfile("/tmp/PieMarquee.log") == True:
        f = open('/tmp/PieMarquee.log', 'r')
        line = f.readline()
        f.close()
        words = line.split()
        if len(words) > 1 and words[0] == "Game:": # In the gamelist-> Game: /home/pi/.../*.zip
            path = line.replace('Game: ','')
            sysname = path.replace('"','').split("/")[-2]
            if sysname in arcade:
                sysname = "arcade"
            romname = path.replace('"','').split("/")[-1].split(".")[0]
            sleep_interval = 0.1 # for quick view
        elif len(words) == 1:
            sysname = "system"
            if words[0] == "SystemView":
                romname = "maintitle"
            else:
                romname = words[0]

    else:
        sysname = "system"
        romname = "maintitle"
   
    if os.path.isfile("/home/pi/PieMarquee2/marquee/" + sysname  + "/" + romname + ".png") == True:
        imgname = sysname + "/" + romname
        if ingame == "*":
            publisher = get_publisher(romname)
            if os.path.isfile("/home/pi/PieMarquee2/marquee/publisher/" + publisher + ".png") == True:
                pubpath = "/home/pi/PieMarquee2/marquee/publisher/" + publisher + ".png"
            if os.path.isfile("/home/pi/PieMarquee2/marquee/instruction/" + romname + ".png") == True:
                instpath = "/home/pi/PieMarquee2/marquee/instruction/" + romname + ".png"
    elif os.path.isfile("/home/pi/PieMarquee2/marquee/" + sysname + ".png") == True:
        imgname = "system/" + sysname
    else:
        imgname = "system/maintitle"
        
    if imgname+ingame != cur_imgname: # change marquee images
        kill_proc("omxplayer.bin")
        if imgname == "maintitle" and os.path.isfile("/home/pi/PieMarquee2/marquee/maintitle.mp4") == True:
            ## for DPI screen
            #os.system("omxplayer --loop --no-osd --display 4 /home/pi/PieMarquee2/marquee/maintitle.mp4 &")            
            ## for Pi4 hdmi1
            os.system("omxplayer --loop --no-osd --display 7 /home/pi/PieMarquee2/marquee/maintitle.mp4 &")            
        else:
            '''
            f = open("/tmp/marquee.txt", "w")
            if pubpath != "":
                f.write(pubpath+"\n")
            f.write("/home/pi/PieMarquee2/marquee/" + imgname + ".png")
            if instpath != "":
                f.write("\n"+instpath)
            f.close()
            '''
            if os.path.isfile("/home/pi/PieMarquee2/marquee/custom/" + romname  + ".txt") == True and ingame == "*":
                os.system("cp /home/pi/PieMarquee2/marquee/custom/" + romname  + ".txt /tmp/marquee.txt")
            else:
                imgpath = "/home/pi/PieMarquee2/marquee/" + imgname + ".png"
                if ingame == "*":
                    if pubpath != "":
                        imgpath = pubpath+"\n"+imgpath
                    if instpath != "":
                        imgpath = imgpath+"\n"+instpath
                os.system('echo "' + imgpath + '" > /tmp/marquee.txt')
            sleep(0.2) 
            if is_running("omxiv-marquee") == False: # if omxiv failed, execute again
                os.system("clear > /dev/tty1")
                os.system('echo "' + imgpath + '" > /tmp/marquee.txt')
                os.system(VIEWER)
            cur_imgname = imgname+ingame

    sleep(sleep_interval)
