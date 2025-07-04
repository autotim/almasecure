# 🔐 SSHD Role – AlmaSecure™

> Hardened SSH configuration for AlmaLinux 9.6 using Ansible
> 🧬 Part of: `roles/sshd/`

---

## 🎯 Objective

Lock down `sshd_config` using secure defaults and idempotent tasks:
- Disable root login
- Disable password auth
- Set custom SSH port
- Enforce client timeouts
- Block X11 forwarding and DNS lookups

---

## 🧩 Included Files

| Path                    | Purpose                                       |
|-------------------------|-----------------------------------------------|
| `tasks/main.yml`        | Main logic to apply hardened sshd config      |
| `defaults/main.yml`     | Defines `ssh_port` (default: 22)              |
| `handlers/main.yml`     | Triggers reload of `sshd` after config change |
| `meta/main.yml`         | Role metadata for Ansible Galaxy compatibility|

---

## ⚙️ Variables

| Variable    | Description                      | Default |
|-------------|----------------------------------|---------|
| `ssh_port`  | Custom SSH port for hardening    | `22`    |

Override example:
```yaml
ssh_port: 60122
```

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
