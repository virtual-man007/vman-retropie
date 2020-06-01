#!/bin/bash
# v30.05.20

infobox=""
infobox="${infobox}\n"
infobox="${infobox}OverClocking Your Pi Board\n\n"
infobox="${infobox}\n"
infobox="${infobox}This will apply necessary configuration to enable/disable overclocking.\n"
infobox="${infobox}A 3A+ PSU & a fan for good CPU cooling is recommended!\n"
infobox="${infobox}Options:\nPi4 at 1750/2000/2100/2147MHz \n"
infobox="${infobox}NOTE: Last Pi4 Option Requires Firmware vl805-000137ab.bin or newer!!! Enabled on PlayBox\n\n"
infobox="${infobox}**Enable**\n"
infobox="${infobox}Overclocks the CPU\n"
infobox="${infobox}\n"
infobox="${infobox}**Disable**\n"
infobox="${infobox}Disables Overclocking"
infobox="${infobox}\n"

dialog --backtitle "Pi OverClocking" \
--title "Pi OverClocking By 2Play! Based on RPC80 Code" \
--msgbox "${infobox}" 35 110

# Config file path
CONFIG_PATH=/boot/config.txt

# Overclocking settings description
OVERCLOCK_DESCRIPTION="#uncomment to enable custom overclock settings"

declare -a OVERCLOCK_SETTINGS=(
    "over_voltage=6"
	"gpu_freq=600"
)

function main_menu() {
    local choice
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose your OverClocking Option:" 25 75 20 \
            - "*** OVERCLOCKING OPTIONS Pi4  ***" \
            1 " - Enable  OverClocking - Pi4 [1750MHz]" \
            2 " - Enable  OverClocking - Pi4 [2000MHz]" \
            3 " - Enable  OverClocking - Pi4 [2100MHz]" \
            4 " - Enable  OverClocking - Pi4 [2147MHz]" \
            5 " - Disable OverClocking" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) enable_oc 1750;;
            2) enable_oc 2000;;
            3) enable_oc+ 2100;;
            3) enable_oc+ 2147;;
            5) disable_oc ;;
            -) none ;;
            *) break ;;
        esac
    done
}

# Enables Overclocking by adding properties to /boot/config.txt
function enable_oc() {
  dialog --infobox "...Applying..." 3 20 ; sleep 2
#  overclock_setup
  sudo sed -i "s|#*arm_freq=.*|arm_freq=$1|" "${CONFIG_PATH}";
  for val in ${OVERCLOCK_SETTINGS[@]}; do
    if grep -q "#${val}" ${CONFIG_PATH}; then
      sudo sed -i "s|#${val}|${val}|" "${CONFIG_PATH}"; 
    fi
  done
  sudo sed -i "s|gpu_freq=750|gpu_freq=600|" "${CONFIG_PATH}"; 
  sudo sed -i "s|#gpu_freq=600|gpu_freq=600|" "${CONFIG_PATH}"; 
  echo
clear
echo
read -n 1 -s -r -p "Press any key to reboot"
  echo
  echo "[OK] Rebooting Raspberry Pi ... "
  sudo reboot
}

# Enables Overclocking by adding properties to /boot/config.txt
function enable_oc+() {
  dialog --infobox "...Applying..." 3 20 ; sleep 2
#  overclock_setup
  sudo sed -i "s|#*arm_freq=.*|arm_freq=$1|" "${CONFIG_PATH}";
  for val in ${OVERCLOCK_SETTINGS[@]}; do
    if grep -q "#${val}" ${CONFIG_PATH}; then
      sudo sed -i "s|#${val}|${val}|" "${CONFIG_PATH}"; 
    fi
  done
  sudo sed -i "s|gpu_freq=600|gpu_freq=750|" "${CONFIG_PATH}"; 
  echo
clear
echo
read -n 1 -s -r -p "Press any key to reboot"
  echo
  echo "[OK] Rebooting Raspberry Pi ... "
  sudo reboot
}

# Disables overclocking by commenting out overclock values
function disable_oc() {
  dialog --infobox "...Applying..." 3 20 ; sleep 2
#  overclock_setup
  sudo sed -i "s|arm_freq=|#arm_freq=|" "${CONFIG_PATH}";
  for val in ${OVERCLOCK_SETTINGS[@]}; do
    sudo sed -i "s|^${val}|#${val}|" "${CONFIG_PATH}";
  done
  sudo sed -i "s|gpu_freq=750|#gpu_freq=600|" "${CONFIG_PATH}"; 
  echo
clear
echo
read -n 1 -s -r -p "Press any key to reboot"
  echo
  echo "[OK] Rebooting Raspberry Pi ... "
  sudo reboot
}

# Adds overclock entries to config.txt
function overclock_setup() {
  if ! grep -q "${OVERCLOCK_DESCRIPTION}" ${CONFIG_PATH}; then
    sudo echo -e "\n${OVERCLOCK_DESCRIPTION}" >> ${CONFIG_PATH}
    for val in ${OVERCLOCK_SETTINGS[@]}; do
      if ! grep -q "${val}" ${CONFIG_PATH}; then
        sudo echo $val >> ${CONFIG_PATH}
      fi
    done
  fi
}


main_menu
