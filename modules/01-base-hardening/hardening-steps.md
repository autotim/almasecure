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

## 📄 hardening-steps.md (CLI Breakdown)

### 💻 Hostname
```bash
hostnamectl set-hostname your.host.name
```
Sets the system's fully qualified domain name (FQDN).

---

### 🧑�⚖️ Lock Root Account (Optional)
```bash
passwd -l root
```
Disables password login for the root account. Still allows key-based access.

---

### ❌ Disable Ctrl+Alt+Del
```bash
ln -sf /dev/null /etc/systemd/system/ctrl-alt-del.target
systemctl daemon-reexec
```
Prevents accidental reboots from physical keyboard shortcut.

---

### ⚖️ Kernel Hardening (Sysctl)
```bash
sysctl --system
```
Applies kernel-level networking protections via `/etc/sysctl.d/99-almasecure.conf`:
- Disable IP forwarding
- Drop source routing
- Drop ICMP redirects
- Enable SYN cookies
- Enable reverse path filtering

---

### 🔎 Login Banners
```bash
cat <<EOF > /etc/issue
Authorized access only. Disconnect IMMEDIATELY if you are not authorized.
EOF
cat <<EOF > /etc/issue.net
WARNING: This system is monitored and protected.
EOF
```
Informs users of system policy and legal disclaimers.

---

### 📆 Time Synchronization
```bash
dnf install -y chrony
systemctl enable --now chronyd
```
Installs and enables the Chrony daemon for accurate timekeeping.

---

### 🔢 Remove Unneeded Packages
```bash
dnf remove -y cups avahi bluetooth wpa_supplicant modemmanager telnet rsh ypbind talk xinetd
```
Uninstalls legacy or unnecessary services that can increase the attack surface.

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
