#!/bin/bash
# 📦 dnf-groups.sh — Manage DNF package groups
# AlmaSecure™ Project – Module 03: DNF Package Control

set -euo pipefail

log() {
  echo -e "[\e[1;34mGROUP\e[0m] $1"
}

# 📋 List all available groups
log "Listing available package groups..."
dnf group list

# 🎯 Choose action
echo -e "\nChoose an action:"
echo "1) Install a group"
echo "2) Remove a group"
echo "3) Info about a group"
echo "4) Exit"
read -rp "Select option [1-4]: " CHOICE

case $CHOICE in
  1)
    read -rp "Enter group name to install (e.g. 'Security Tools'): " GRP
    dnf group install -y "$GRP"
    log "✅ Group '$GRP' installed."
    ;;
  2)
    read -rp "Enter group name to remove (e.g. 'Security Tools'): " GRP
    dnf group remove -y "$GRP"
    log "❌ Group '$GRP' removed."
    ;;
  3)
    read -rp "Enter group name to inspect: " GRP
    dnf group info "$GRP"
    ;;
  *)
    log "No action taken. Exiting."
    ;;
esac

exit 0
