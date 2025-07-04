#!/bin/bash
# 🏗️ structure.sh — Set up ansible-roles module directory structure
# AlmaSecure™ Project – Module 06: ansible-roles

set -euo pipefail

log() {
  echo -e "[\e[1;36mSTRUCT\e[0m] $1"
}

log "Creating Ansible roles directory layout..."

mkdir -p roles/{firewalld,sshd,selinux,audit,dnf,backups}/{tasks,defaults,handlers,vars,meta,files,templates}
mkdir -p playbooks
mkdir -p inventory/group_vars

# Drop .gitkeep in empty dirs for Git tracking
find roles -type d -exec touch {}/.gitkeep \;
touch playbooks/.gitkeep

touch inventory/hosts
cat <<EOF > inventory/group_vars/all.yml
---
# 🔐 Global default vars for all roles
EOF

log "✅ Ansible roles structure created."
exit 0
