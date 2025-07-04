#!/bin/bash
# 🤖 ks-generate.sh — Generate a custom AlmaSecure™ Kickstart file interactively
# AlmaSecure™ Project – Module 05: automation-kickstart

set -euo pipefail

OUT="custom-ks.cfg"

echo "🚀 AlmaSecure™ Kickstart Generator"
echo "-------------------------------------"

read -rp "📛 Hostname (e.g. secure-node): " HOSTNAME
read -rp "🌍 Timezone (e.g. Europe/Berlin): " TIMEZONE
read -rp "🔑 Root password (will be hashed): " ROOTPASS
HASHED_PASS=$(openssl passwd -6 "$ROOTPASS")

cat <<EOF > "$OUT"
#version=RHEL9
install
lang en_US.UTF-8
keyboard us
network --bootproto=dhcp --device=eth0 --hostname=$HOSTNAME --onboot=on

rootpw --iscrypted $HASHED_PASS
firewall --enabled --service=ssh
selinux --enforcing
timezone $TIMEZONE --isUtc

text
skipx

autopart --type=lvm

%packages
@^minimal-environment
kexec-tools
chrony
vim-enhanced
%end

%post --log=/root/ks-post.log
curl -s https://your-domain/autohard/postinstall.sh | bash -
%end
EOF

echo "✅ Kickstart file generated: $OUT"
exit 0
