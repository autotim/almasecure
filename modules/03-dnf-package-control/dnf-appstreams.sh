#!/bin/bash
# 🧩 dnf-appstreams.sh — Manage AppStream modules (list, enable, reset)
# AlmaSecure™ Project – Module 03: DNF Package Control

set -euo pipefail

log() {
  echo -e "[\e[1;35mSTREAM\e[0m] $1"
}

# 📋 List all AppStream modules
log "Listing all AppStream modules..."
dnf module list

# 🎯 Ask for module name to modify
read -rp $'\n🧩 Enter the module name to manage (e.g. php, mariadb): ' MOD
if [[ -z "$MOD" ]]; then
  log "No module name entered. Exiting."
  exit 0
fi

# ⚙️ Choose action
echo -e "\nChoose action for module '$MOD':"
echo "1) Enable"
echo "2) Disable"
echo "3) Reset"
echo "4) Exit"
read -rp "Select option [1-4]: " CHOICE

case $CHOICE in
  1)
    dnf module enable -y "$MOD"
    log "✅ Module '$MOD' enabled."
    ;;
  2)
    dnf module disable -y "$MOD"
    log "🚫 Module '$MOD' disabled."
    ;;
  3)
    dnf module reset -y "$MOD"
    log "♻️ Module '$MOD' reset."
    ;;
  *)
    log "No action taken. Exiting."
    ;;
esac

exit 0
