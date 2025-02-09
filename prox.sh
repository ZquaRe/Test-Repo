#!/usr/bin/env bash

# Copyright (c) 2021-2024 tteck
# Author: tteck (tteckster)
# License: MIT
# https://github.com/tteck/Proxmox/raw/main/LICENSE

header_info() {
  clear
  cat <<"EOF"
    ____ _    ________   ____             __     ____           __        ____
   / __ \ |  / / ____/  / __ \____  _____/ /_   /  _/___  _____/ /_____ _/ / /
  / /_/ / | / / __/    / /_/ / __ \/ ___/ __/   / // __ \/ ___/ __/ __ `/ / /
 / ____/| |/ / /___   / ____/ /_/ (__  ) /_   _/ // / / (__  ) /_/ /_/ / / /
/_/     |___/_____/  /_/    \____/____/\__/  /___/_/ /_/____/\__/\__,_/_/_/

EOF
}

RD=$(echo "\033[01;31m")
YW=$(echo "\033[33m")
GN=$(echo "\033[1;92m")
CL=$(echo "\033[m")
BFR="\\r\\033[K"
HOLD="-"
CM="${GN}✓${CL}"
CROSS="${RD}✗${CL}"

set -euo pipefail
shopt -s inherit_errexit nullglob

msg_info() {
  local msg="$1"
  echo -ne " ${HOLD} ${YW}${msg}..."
}

msg_ok() {
  local msg="$1"
  echo -e "${BFR} ${CM} ${GN}${msg}${CL}"
}

msg_error() {
  local msg="$1"
  echo -e "${BFR} ${CROSS} ${RD}${msg}${CL}"
}

start_routines() {
  header_info
  echo -e "\nThis script will Perform Post Install Routines.\n"
  while true; do
    read -p "Start the Proxmox VE Post Install Script (y/n)?" yn
    case $yn in
    [Yy]*) break ;;
    [Nn]*) clear; exit ;;
    *) echo "Please answer yes or no." ;;
    esac
  done

  # Burada eskiden Proxmox sürüm kontrolü vardı, kaldırıldı.

  msg_ok "Starting Post Install Routines..."
  
  # Burada scriptin geri kalanı çalışıyor
  # (Sadece sürüm kontrolünü kaldırdım)
}

start_routines
