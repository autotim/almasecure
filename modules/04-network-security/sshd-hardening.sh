#!/bin/bash
# 🔐 sshd-hardening.sh — Secure OpenSSH daemon configuration interactively
# AlmaSecure™ Project – Module 04: Network Security

set -euo pipefail

SSHD_CONFIG="/etc/ssh/sshd_config"
BACKUP="${SSHD_CONFIG}.bak.$(date +%s)"

log() {
  echo -e "[\e[1;35mSSHD\e[0m] $1"
}

# 🧾 Backup existing config
cp "$SSHD_CONFIG" "$BACKUP"
log "Backup saved: $BACKUP"

# 🔢 Ask for SSH port
read -rp $'\n🔢 Enter SSH Port [default 22]: ' SSH_PORT
SSH_PORT=${SSH_PORT:-22}

# 🚫 Disable root login
read -rp "🚫 Disable root SSH login? [y/N]: " DISABLE_ROOT

# 🔒 Password Authentication
read -rp "🔐 Disable password authentication (key-only)? [y/N]: " DISABLE_PASS

# ⏱️ Add login rate limiting (MaxAuthTries, MaxSessions)
read -rp "⏱️ Limit MaxAuthTries to 3? [y/N]: " LIMIT_TRIES
read -rp "⛔ Limit MaxSessions to 2? [y/N]: " LIMIT_SESS

# 🧽 Clean old overrides
sed -i '/^Port /d;/^PermitRootLogin /d;/^PasswordAuthentication /d;/^MaxAuthTries /d;/^MaxSessions /d/' "$SSHD_CONFIG"

# 🔧 Apply changes
echo -e "\nPort $SSH_PORT" >> "$SSHD_CONFIG"
[[ "$DISABLE_ROOT" =~ ^[Yy]$ ]] && echo "PermitRootLogin no" >> "$SSHD_CONFIG"
[[ "$DISABLE_PASS" =~ ^[Yy]$ ]] && echo "PasswordAuthentication no" >> "$SSHD_CONFIG"
[[ "$LIMIT_TRIES" =~ ^[Yy]$ ]] && echo "MaxAuthTries 3" >> "$SSHD_CONFIG"
[[ "$LIMIT_SESS" =~ ^[Yy]$ ]] && echo "MaxSessions 2" >> "$SSHD_CONFIG"

# ✅ Restart service
log "Reloading sshd..."
sshd -t && systemctl restart sshd && log "✅ sshd hardened and restarted."

exit 0
