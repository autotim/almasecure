#!/bin/bash
# 🧱 kernel-net-tuning.sh — Harden TCP/IP stack with sysctl
# AlmaSecure™ Project – Module 04: Network Security

set -euo pipefail

log() {
  echo -e "[\e[1;36mSYSCTL\e[0m] $1"
}

SYSCTL_FILE="/etc/sysctl.d/99-almasecure-net.conf"

log "Applying hardened sysctl values to $SYSCTL_FILE..."

cat <<EOF > "$SYSCTL_FILE"
# AlmaSecure™ Network Stack Hardening
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.tcp_syncookies = 1
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_rfc1337 = 1
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
EOF

sysctl --system
log "✅ Kernel network stack hardening applied."

exit 0