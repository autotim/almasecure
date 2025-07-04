#!/bin/bash
# 🔐 selinux-enable.sh — Enforce SELinux system-wide on AlmaLinux 9.6
# AlmaSecure™ Project – Module 02: SELinux

set -euo pipefail

log() {
  echo -e "[\e[1;32mINFO\e[0m] $1"
}

warn() {
  echo -e "[\e[1;33mWARN\e[0m] $1"
}

# 🔍 Check current SELinux status
SELINUX_MODE=$(getenforce)
CONFIG_MODE=$(grep ^SELINUX= /etc/selinux/config | cut -d= -f2)

log "Current runtime SELinux mode: $SELINUX_MODE"
log "Configured SELinux mode in /etc/selinux/config: $CONFIG_MODE"

# 🛡️ Set to enforcing in config file
sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
log "SELINUX=enforcing has been written to /etc/selinux/config"

# 🔁 Apply enforcing mode live (if not already)
if [ "$SELINUX_MODE" != "Enforcing" ]; then
  setenforce 1 && log "SELinux is now in Enforcing mode (runtime)" || warn "Failed to switch SELinux to Enforcing (runtime). Reboot may be required."
else
  log "SELinux is already in Enforcing mode"
fi

# 🧪 Show SELinux status summary
sestatus
log "✅ SELinux enforcing setup complete."

exit 0
