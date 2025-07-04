# 📦 Module: 01-base-hardening

🔐 **Core system lockdown for AlmaLinux 9.6**  
This module applies essential security hardening to create a strong baseline before deploying production services.

---

## 🧱 Included Hardening Steps

| Step | Description |
|------|-------------|
| 💻 Hostname | Set fully-qualified hostname (FQDN) |
| 🧑�⚖️ Root Lock | Optional prompt to lock root account |
| ❌ Ctrl+Alt+Del | Disable system reboot via keyboard combo |
| ⚖️ Kernel Hardening | Apply hardened `sysctl` rules for IPv4 stack |
| 🔎 Login Banners | Display login and legal warning messages |
| 📆 Time Sync | Install and enable `chronyd` |
| 🔢 Package Removal | Remove unneeded packages (printer, bluetooth, telnet, etc.) |

---

## 🚀 Script: `base-hardening.sh`

This script is designed to be run **immediately after OS install**.

```bash
sudo bash base-hardening.sh
```

It is **idempotent** (safe to re-run), and logs progress in real-time.

---

## 🛡️ Security Principles

- **Least Access**: Disables unused features and local login
- **Defense in Depth**: Sysctl tuning protects the kernel interface
- **Auditable**: All actions logged via `log()` with emoji markers

---

## 📁 Files

| File | Type | Description |
|------|------|-------------|
| `base-hardening.sh` | `script` | Main automation script |
| `hardening-steps.md` | `doc` | Explains each security step |
| `info.md` | `meta` | File index with emoji-coded notes |

---

## 📦 Example Output

```
[INFO] Hostname set to secure-node.alma.local
[INFO] Root account locked
[INFO] Ctrl+Alt+Del disabled
[INFO] Sysctl kernel hardening applied
[INFO] Login banners configured
[INFO] Chrony time sync enabled
[INFO] Unneeded packages removed: cups avahi ...
[INFO] 🛡️ Base hardening completed successfully.
```

---

## 💬 Notes

- 🔁 You can safely re-run this script after changes
- 🧪 For production servers, pair with `02-selinux` module next

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
