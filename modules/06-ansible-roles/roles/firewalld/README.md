# 🔥 firewalld Role – AlmaSecure™

> Hardened firewall configuration for AlmaLinux 9.6 using firewalld
> 🧬 Part of: `roles/firewalld/`

---

## 🎯 Objective

- Enforce `firewalld` installation and activation
- Configure default zone and interface
- Open secure ports via variables
- Reload firewalld when config changes

---

## 🧩 Included Files

| Path                    | Purpose                                      |
|-------------------------|----------------------------------------------|
| `tasks/main.yml`        | Main tasks: install + configure firewalld    |
| `defaults/main.yml`     | Defines `firewall_open_ports` list           |
| `handlers/main.yml`     | Reloads firewalld when ports are changed     |
| `meta/main.yml`         | Role metadata for Galaxy or reuse            |

---

## ⚙️ Variables

| Variable              | Description                          | Default               |
|------------------------|--------------------------------------|------------------------|
| `firewall_open_ports` | List of TCP ports to open            | `[22, 80, 443]`        |

Override example:
```yaml
firewall_open_ports:
  - 22
  - 60122
  - 443
```

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
