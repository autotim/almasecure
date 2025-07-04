# 📦 Module: 02-selinux

🔐 **Deep SELinux configuration and enforcement for AlmaLinux 9.6**  
This module strengthens access control using mandatory MAC policies and context rules.

---

## 🧱 Objectives

| Goal | Description |
|------|-------------|
| 🔄 Enable SELinux | Ensure it is in `enforcing` mode system-wide |
| 🧪 Policy Checks | Analyze current contexts, booleans, and audit logs |
| 🛠️ Custom Rules | Optional local policy modules and context mappings |
| 📊 Audit Tools | Use `audit2allow`, `semanage`, `seinfo`, `sesearch` effectively |

---

## 🚀 Scripts (planned)

- `selinux-enable.sh` – Switch system to enforcing mode
- `selinux-custom-policy.sh` – Build and install local policy modules
- `selinux-audit-tools.sh` – Use `audit2allow`, `ausearch`, and others to analyze logs

---

## 📁 Files (to be created)

| File Name                 | Type     | Purpose                                                |
|--------------------------|----------|--------------------------------------------------------|
| `selinux-enable.sh`      | 🛠️ Script  | Enables and validates SELinux enforcement              |
| `selinux-custom-policy.sh` | 🛠️ Script | Compiles and loads custom policies                     |
| `selinux-audit-tools.sh` | 🛠️ Script | Parses audit logs, builds rules using `audit2allow`    |
| `README.md`              | 📘 Doc     | Overview, usage, and examples                          |
| `info.md`                | 🧭 Index   | File reference and symbolic meaning legend             |

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
