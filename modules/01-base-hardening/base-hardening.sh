#!/bin/bash
# AlmaSecure™ - base-hardening.sh
# 🔐 System lockdown script for AlmaLinux 9.6

set -euo pipefail

log() {
  echo -e "[\e[1;34mINFO\e[0m] $1"
}

# 📁 1. Set Hostname (FQDN)
read -rp "💻 Enter full hostname (FQDN) [secure-node.alma.local]: " HOSTNAME
hostnamectl set-hostname "${HOSTNAME:-secure-node.alma.local}"
log "Hostname set to ${HOSTNAME:-secure-node.alma.local}"

# ❌ 2. Lock Root Account (Optional)
echo "🔐 Do you want to lock the root account (disable password login)? [y/N]: "
read -r LOCKROOT
if [[ "$LOCKROOT" =~ ^[Yy]$ ]]; then
  passwd -l root
  log "Root account locked"
else
  log "Root account lock skipped"
fi

# ❌ 3. Disable Ctrl+Alt+Del
ln -sf /dev/null /etc/systemd/system/ctrl-alt-del.target
systemctl daemon-reexec
log "Ctrl+Alt+Del disabled"

# ⚖️ 4. Kernel Sysctl Settings
cat <<EOF > /etc/sysctl.d/99-almasecure.conf
# AlmaSecure™ kernel hardening
net.ipv4.ip_forward = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.tcp_syncookies = 1
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
EOF

sysctl --system
log "Sysctl kernel hardening applied"

# 🔎 5. Login Banners
cat <<EOF > /etc/issue
Authorized access only. Disconnect IMMEDIATELY if you are not authorized.
EOF
cat <<EOF > /etc/issue.net
WARNING: This system is monitored and protected.
EOF
log "Login banners configured"

# 📆 6. Time Sync
dnf install -y chrony
systemctl enable --now chronyd
log "Chrony time sync enabled"

# 🔢 7. Remove Unneeded Packages
REMOVE_PKGS=(
  cups
  avahi
  bluetooth
  wpa_supplicant
  modemmanager
  telnet
  rsh
  ypbind
  talk
  xinetd
)

dnf remove -y "${REMOVE_PKGS[@]}"
log "Unneeded packages removed: ${REMOVE_PKGS[*]}"

# ✅ Done
log "🛡️ Base hardening completed successfully."
exit 0
