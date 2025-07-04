#!/bin/bash
# 🔒 dnf-lockdown.sh — Lock specific packages to prevent upgrades
# AlmaSecure™ Project – Module 03: DNF Package Control

set -euo pipefail

log() {
  echo -e "[\e[1;31mLOCK\e[0m] $1"
}

# 📦 Check if versionlock plugin is installed
if ! rpm -q dnf-plugin-versionlock &>/dev/null; then
  log "Installing versionlock plugin..."
  dnf install -y dnf-plugin-versionlock
fi

# 📋 List locked packages
log "Current locked packages:"
dnf versionlock list || log "No packages currently locked."

# ➕ Lock new packages
read -rp $'\n📦 Enter packages to lock (space-separated): ' PKGS
if [[ -z "$PKGS" ]]; then
  log "No packages entered. Skipping lock."
else
  dnf versionlock add $PKGS
  log "✅ Locked: $PKGS"
fi

# ❌ Option to remove locks
read -rp $'\n🧹 Do you want to remove any locks now? [y/N]: ' REMOVE
if [[ "$REMOVE" =~ ^[Yy]$ ]]; then
  read -rp "Enter packages to unlock (space-separated): " UNLOCK
  dnf versionlock delete $UNLOCK
  log "🔓 Unlocked: $UNLOCK"
else
  log "No unlocks performed."
fi

exit 0
