# 🌐 Module: 04-network-security

🛡️ **Network hardening, firewalling, and SSH lockdown for AlmaLinux 9.6**  
This module secures all entry points using layered defense: firewall, fail2ban, sshd restrictions, and kernel net stack tuning.

---

## 🧱 Goals

| Area              | Description |
|-------------------|-------------|
| 🔥 Firewall        | Enable `firewalld` and manage rich rules             |
| 🧱 Kernel Tuning   | Lock down ICMP, spoofing, and SYN flood defense      |
| 🔐 SSH Security    | Harden `sshd_config`, disable root login, rate limit |
| 🚫 Service Pruning | Identify and close exposed ports & legacy daemons    |
| 🚨 Intrusion Prep  | Set up fail2ban for brute force detection            |

---

## 🚀 Planned Scripts

| Script Name            | Description |
|------------------------|-------------|
| `firewall-config.sh`   | Configure zones, services, custom rich rules     |
| `kernel-net-tuning.sh` | Apply sysctl rules for TCP/IP hardening          |
| `sshd-hardening.sh`    | Rewrite sshd_config with best practices          |
| `fail2ban-setup.sh`    | Install and configure Fail2Ban jail policies     |
| `network-audit.sh`     | Scan open ports, services, interfaces            |

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
