#!/bin/bash
# 🔄 dnf-rollback.sh — Rollback DNF transactions safely
# AlmaSecure™ Project – Module 03: DNF Package Control

set -euo pipefail

log() {
  echo -e "[\e[1;34mROLLBACK\e[0m] $1"
}

# 📋 Show DNF transaction history
log "Listing DNF transaction history..."
dnf history

# 🔍 Ask user to choose rollback target
read -rp $'\n🔢 Enter the transaction ID to roll back to (or press ENTER to exit): ' TXID

if [[ -z "$TXID" ]]; then
  log "No rollback target selected. Exiting."
  exit 0
fi

# 🌀 Show diff of target transaction
log "Showing detailed info for transaction $TXID..."
dnf history info "$TXID"

# ⚠️ Confirm rollback
read -rp $'\n⚠️ Are you sure you want to undo this transaction? [y/N]: ' CONFIRM
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
  log "Rollback cancelled."
  exit 0
fi

# 🚀 Perform rollback
log "Performing rollback..."
dnf history rollback "$TXID"

log "✅ Rollback to transaction $TXID completed."
exit 0
