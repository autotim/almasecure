# 🛰️ Ansible Roles – Module 06: ansible-roles

> Harden, configure, and automate AlmaLinux 9.6 using reusable Ansible roles.
> Applies Project-Matrix™ DNA to your infrastructure-as-code.

---

## 🎯 Goals

- Create modular, secure Ansible roles for AlmaSecure
- Automate DNF, SSH, firewall, SELinux, auditing, backups, and more
- Use clean variable defaults and handler logic
- Compatible with Ansible 2.15+ and AlmaLinux 9.x

---

## 📦 Components

| Folder / File             | Purpose                                                  |
|---------------------------|----------------------------------------------------------|
| `roles/`                  | All hardened roles live here (firewalld, sshd, etc.)     |
| `playbooks/`              | Example playbooks using the roles in secure pipelines    |
| `inventory/`              | Sample static inventory with host/group structure        |
| `README.md`               | This file – module overview and structure                |
| `info.md`                 | Final index with emoji tags and file descriptions        |

---

## 📌 Best Practices

- All roles must be **idempotent**, reusable, and minimal
- Defaults in `defaults/main.yml`, secure override in `vars/`
- Roles must tag all tasks, define handlers, and support check mode

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
