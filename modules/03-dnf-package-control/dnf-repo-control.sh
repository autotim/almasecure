#!/bin/bash
# 📜 dnf-repo-control.sh — View, enable, disable, and prioritize repositories
# AlmaSecure™ Project – Module 03: DNF Package Control

set -euo pipefail

log() {
  echo -e "[\e[1;32mREPO\e[0m] $1"
}

# 📋 Show all repositories
log "Listing all configured repositories:"
dnf repolist all

# 🎯 Choose a repo to modify
read -rp $'\n📦 Enter the repo ID to manage (e.g. epel, appstream): ' REPO
if [[ -z "$REPO" ]]; then
  log "No repo entered. Exiting."
  exit 0
fi

# ⚙️ Choose action
echo -e "\nChoose action for repository '$REPO':"
echo "1) Enable"
echo "2) Disable"
echo "3) Set Priority"
echo "4) Exit"
read -rp "Select option [1-4]: " CHOICE

REPO_FILE="/etc/yum.repos.d/${REPO}.repo"
if [[ ! -f "$REPO_FILE" ]]; then
  log "⚠️ Warning: '$REPO_FILE' not found. You may need to create or edit it manually."
fi

case $CHOICE in
  1)
    dnf config-manager --set-enabled "$REPO"
    log "✅ Repository '$REPO' enabled."
    ;;
  2)
    dnf config-manager --set-disabled "$REPO"
    log "🚫 Repository '$REPO' disabled."
    ;;
  3)
    read -rp "Enter numeric priority (1 = highest): " PRIO
    if [[ -n "$PRIO" && -f "$REPO_FILE" ]]; then
      if grep -q '^priority=' "$REPO_FILE"; then
        sed -i "s/^priority=.*/priority=$PRIO/" "$REPO_FILE"
      else
        sed -i "/^\[${REPO}\]/a priority=$PRIO" "$REPO_FILE"
      fi
      log "⭐ Set priority=$PRIO for '$REPO'"
    else
      log "⚠️ Invalid priority or repo file missing."
    fi
    ;;
  *)
    log "No action taken. Exiting."
    ;;
esac

exit 0
