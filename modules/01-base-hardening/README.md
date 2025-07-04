# 📘 01-base-hardening/README.md – AlmaSecure™ Module 01

> Foundational server hardening for AlmaLinux 9.6+.

---

## 🔐 Purpose

Establishes the baseline security posture for a newly deployed AlmaLinux system. Covers root account security, login warnings, sysctl tuning, hostname configuration, time sync, and basic de-bloating.

---

## 🧩 Tasks Included

| Task                | Description                                                              |
|---------------------|--------------------------------------------------------------------------|
| 💻 `Hostname`        | Set a fully-qualified domain name (FQDN)                                 |
| 🧑�💻 `Root Lock`       | Optionally lock the root account for interactive login                 |
| ⛔ `Ctrl+Alt+Del`     | Disable reboot via keyboard combo (console lockdown)                   |
| ⚠️ `Kernel Hardening`| Apply hardened IPv4 network stack `sysctl` rules                        |
| 🔒 `Login Banners`    | Deploy standard login banners for `/etc/issue`, `/etc/motd`, etc.     |
| 📆 `Time Sync`        | Enable NTP time sync using `chronyd`                                   |
| 🔧 `Package Removal`  | De-bloat system by removing insecure/unwanted packages (e.g., `telnet`) |

---

## 🛠️ Usage

This module is typically executed first. Run via:

```bash
ansible-playbook -i ../../inventory/hosts site.yml
```

---

## 🔧 Related Files

- `site.yml` – main playbook
- `roles/` – Ansible roles: `sshd`, `selinux`, `firewalld`, etc.
- `defaults/` – Role-specific variables
- `vars/` – System-wide hardening values

---

## 🧬 Project-Matrix™ DNA
> Professionalism + Readability + Repo Hygiene = 🧬
