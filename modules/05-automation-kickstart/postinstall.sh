#!/bin/bash
# 🛠️ postinstall.sh — Run after Kickstart to harden AlmaLinux
# AlmaSecure™ Project – Module 05: automation-kickstart

set -euo pipefail

log() {
  echo -e "[\e[1;32mPOST\e[0m] $1"
}

log "Starting AlmaSecure™ post-install sequence..."

# ✅ Update system
log "Running full system update..."
dnf update -y

# 🔒 Enforce SELinux mode
log "Verifying SELinux enforcing mode..."
selinuxenabled && log "SELinux is active." || (setenforce 1 && log "SELinux enforcing activated.")

# 🧱 Kernel and firewall prep
log "Installing hardening tools..."
dnf install -y vim-enhanced firewalld fail2ban policycoreutils-python-utils

# 🧹 Clean dnf cache
log "Cleaning up DNF cache..."
dnf clean all

# 🚀 Reboot or continue to manual login
log "✅ Post-install tasks complete. You can now reboot the system."

exit 0
