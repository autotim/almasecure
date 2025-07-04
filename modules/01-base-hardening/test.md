# 📘 01-base-hardening/README.md – AlmaSecure™ Module 01

> Base security preparation for AlmaLinux 9.6 systems

---

## 🔧 Purpose

This module applies foundational security measures to a fresh AlmaLinux install:

| Task                  | Description                                                                      |
|-----------------------|----------------------------------------------------------------------------------|
| 💼 Hostname           | Set system hostname (FQDN)                                                    |
| 🧑�🔧 Root Lock         | Prompt user to optionally lock the root account (passwd -l root)             |
| ❌ Ctrl+Alt+Del       | Disable Ctrl+Alt+Del reboot behavior in systemd                               |
| ⚠️ Kernel Hardening | Harden sysctl config (e.g., disable IP forwarding, enable SYN cookies, etc.) |
| 🔐 Login Banners     | Configure /etc/issue, /etc/motd, /etc/issue.net with legal warnings         |
| 🗓️ Time Sync         | Enable and start `chronyd` for accurate NTP timekeeping                     |
| 🔧 Package Removal   | Strip out insecure packages: `telnet`, `ftp`, etc.                           |

---

## ⚖️ Philosophy

Minimum attack surface. Maximum clarity. All settings applied with user awareness (interactive where needed).

---

## 📁 Files

- `base.sh` – the primary interactive hardening script
- `motd`, `issue`, `issue.net` – text templates for login banners
- `sysctl_hardening.conf` – additional kernel-level protections

---

## ⚛️ Usage

```bash
chmod +x base.sh
sudo ./base.sh
```

---

## 🧪 Notes

- All actions are logged to `base.log`
- You’ll be prompted before any irreversible action
- Can be used as a standalone or first play in a stack

---

## 🧫 Project-Matrix™ DNA
> Professionalism + Readability + Repo Hygiene
> = 🧪 Project-Matrix™ DNA
