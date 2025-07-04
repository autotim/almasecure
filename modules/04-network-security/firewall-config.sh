#!/bin/bash
# 🔥 firewall-config.sh — Configure firewalld zones and rich rules
# AlmaSecure™ Project – Module 04: Network Security

set -euo pipefail

log() {
  echo -e "[\e[1;31mFIREWALL\e[0m] $1"
}

# ✅ Ensure firewalld is installed and running
log "Installing and enabling firewalld..."
dnf install -y firewalld
systemctl enable --now firewalld

# 🌐 Set default zone to 'public'
firewall-cmd --set-default-zone=public
log "Default zone set to 'public'"

# ✅ Allow common services
log "Allowing SSH and DNS in public zone..."
firewall-cmd --zone=public --add-service=ssh --permanent
firewall-cmd --zone=public --add-service=dns --permanent

# 🔒 Custom rich rule: allow SSH only from specific subnet
read -rp $'\n🌐 Enter IP/subnet to allow SSH access from (e.g. 192.168.1.0/24): ' SSH_SUBNET
if [[ -n "$SSH_SUBNET" ]]; then
  firewall-cmd --permanent --zone=public \
    --add-rich-rule="rule family=ipv4 source address=${SSH_SUBNET} service name=ssh accept"
  log "SSH access allowed only from $SSH_SUBNET"
else
  log "No SSH subnet restriction applied."
fi

# 🚫 Drop everything else
log "Dropping all other inbound traffic in 'public' zone"
firewall-cmd --permanent --set-target=DROP

# 💾 Reload config
firewall-cmd --reload
log "✅ Firewall rules applied and firewalld reloaded."

# 🔍 Show result
firewall-cmd --list-all

exit 0
