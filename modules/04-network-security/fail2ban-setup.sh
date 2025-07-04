#!/bin/bash
# 🚨 fail2ban-setup.sh — Install and configure basic SSH jail
# AlmaSecure™ Project – Module 04: Network Security

set -euo pipefail

log() {
  echo -e "[\e[1;31mF2B\e[0m] $1"
}

# 📦 Install Fail2Ban
log "Installing Fail2Ban..."
dnf install -y fail2ban
systemctl enable --now fail2ban

# 🔢 Prompt for SSH Port
read -rp $'\n🔐 Enter SSH port to monitor (e.g. 22, 60122): ' SSH_PORT
SSH_PORT=${SSH_PORT:-22}

# 🗂️ Create local jail config
mkdir -p /etc/fail2ban
cat <<EOF > /etc/fail2ban/jail.local
[sshd]
enabled = true
port    = $SSH_PORT
logpath = %(sshd_log)s
backend = systemd
maxretry = 3
bantime = 3600
findtime = 600
EOF

log "Fail2Ban jail for SSH configured (port=$SSH_PORT, maxretry=3, bantime=1h)"

# ✅ Restart and check status
systemctl restart fail2ban
log "✅ Fail2Ban active. Status summary:"
fail2ban-client status sshd || log "Check logs for potential issues."

exit 0
