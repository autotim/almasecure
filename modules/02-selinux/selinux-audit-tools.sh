#!/bin/bash
# 🧪 selinux-audit-tools.sh — Analyze and convert SELinux AVC denials to allow rules
# AlmaSecure™ Project – Module 02: SELinux

set -euo pipefail

log() {
  echo -e "[\e[1;35mAUDIT\e[0m] $1"
}

# 🔍 Search for recent SELinux denials
log "Searching for AVC denials in audit logs..."
ausearch -m avc -ts recent > selinux-avc.log || true

if [[ -s selinux-avc.log ]]; then
  log "Denials found. Saved to selinux-avc.log"
else
  log "✅ No recent SELinux denials found."
  exit 0
fi

# 📖 Generate allow rules from AVCs
log "Generating allow rules using audit2allow..."
audit2allow -i selinux-avc.log -o selinux-allow.rules

log "Allow rules saved to selinux-allow.rules"
cat selinux-allow.rules

# 🧪 Optional: Build local policy module
read -rp "📦 Do you want to compile these into a module? [y/N]: " CONFIRM
if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
  MODULE_NAME="auto_allow"
  audit2allow -M "$MODULE_NAME" -i selinux-avc.log
  semodule -i "${MODULE_NAME}.pp"
  log "✅ Installed custom module: ${MODULE_NAME}"
else
  log "Skipped module build. Review allow rules manually."
fi

exit 0
