#!/bin/bash
# 🔍 network-audit.sh — Scan open ports, interfaces, and listening services
# AlmaSecure™ Project – Module 04: Network Security

set -euo pipefail

log() {
  echo -e "[\e[1;34mAUDIT\e[0m] $1"
}

# 📡 Interfaces
log "Network Interfaces and IPs:"
ip -brief address

# 📍 Hostname & Gateway
log "Hostname: $(hostname)"
log "Default Gateway: $(ip route | grep default | awk '{print $3}')"

# 📦 List listening TCP/UDP services
log "Listening TCP/UDP Ports:"
ss -tulpen

# 🔎 Scan for exposed ports
log "Running Nmap localhost scan (if installed)..."
if command -v nmap &>/dev/null; then
  nmap -Pn -sS -T4 -p- -v 127.0.0.1
else
  log "Nmap not installed. Run: dnf install -y nmap"
fi

# 🔁 Summary complete
log "✅ Network audit complete."

exit 0
