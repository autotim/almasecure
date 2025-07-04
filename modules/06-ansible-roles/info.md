# 🧭 info.md – File Index: 06-ansible-roles

> 🛰️ Module: `06-ansible-roles`
>
> 📅 AlmaLinux 9.6 | Hardened Infrastructure-as-Code | 🧬 Project-Matrix™ DNA

---

## 📁 Folders & Files

| Path                            | Type     | Purpose                                                   |
|---------------------------------|----------|-----------------------------------------------------------|
| `roles/firewalld/`              | 🔥 Role   | Manage firewalld zones, services, port ACLs               |
| `roles/sshd/`                   | 🔐 Role   | Harden SSHD settings: port, auth, access rules            |
| `roles/selinux/`                | 🧱 Role   | Configure SELinux policy and mode enforcement             |
| `roles/audit/`                  | 🔎 Role   | Enable auditd, configure logging rules                    |
| `roles/dnf/`                    | 📦 Role   | Manage DNF repos, cleanups, group installs                |
| `roles/backups/`                | 💾 Role   | Automate and rotate system backup routines                |
| `playbooks/`                    | 📘 Docs   | Playbook examples using the hardened roles                |
| `inventory/hosts`               | 🧩 Config | Sample static inventory file                              |
| `inventory/group_vars/all.yml` | ⚙️ Vars   | Global defaults for all hosts and roles                   |
| `structure.sh`                  | 🏗️ Script | Builds role folder hierarchy and tracking placeholders     |
| `README.md`                     | 📘 Doc    | Module overview                                           |
| `info.md`                       | 🧭 Index  | This file – emoji legend, module file index               |

---

## 📛 Emoji Legend

| Emoji | Role Area                        |
|--------|----------------------------------|
| 🔥     | Firewall (firewalld)             |
| 🔐     | SSH and secure access            |
| 🧱     | SELinux and system policies      |
| 🔎     | Auditing / logging               |
| 📦     | DNF package control              |
| 💾     | Backup systems                   |
| ⚙️      | Variables and inventory config   |
| 🧩     | Config files                      |
| 📘     | Docs and playbooks               |
| 🏗️     | Structure setup scripts          |
| 🧭     | This index                       |

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
