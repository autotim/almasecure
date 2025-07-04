# 🧱 SELinux Role – AlmaSecure™

> Enforce and persist SELinux mode on AlmaLinux 9.6
> 🧬 Part of: `roles/selinux/`

---

## 🎯 Objective

- Enforce live SELinux mode (enforcing, permissive, disabled)
- Ensure `/etc/selinux/config` reflects correct mode
- Idempotent edits and system-safe application

---

## 🧩 Included Files

| Path                    | Purpose                                       |
|-------------------------|-----------------------------------------------|
| `tasks/main.yml`        | Enforce runtime mode + config file alignment  |
| `defaults/main.yml`     | Defines `selinux_state` variable              |
| `meta/main.yml`         | Role metadata and platform compatibility      |

---

## ⚙️ Variables

| Variable        | Description                         | Default     |
|------------------|-------------------------------------|-------------|
| `selinux_state` | SELinux mode: enforcing/permissive/disabled | `enforcing` |

Override example:
```yaml
selinux_state: permissive
```

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
