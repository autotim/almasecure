# 🤖 Kickstart Automation – Module 05: automation-kickstart

> Fully automate secure AlmaLinux deployments from ISO to hardened system. 
> Integrate with scripts, post-install hooks, and remote provisioning.

---

## 🎯 Goals

- Automate AlmaLinux 9.6 installations using Kickstart
- Include post-install hardening, package policies, and SELinux setup
- Support TUI/VM deployments, ISO embedding, and PXE boot scenarios
- Modular and reproducible structure

---

## 📦 Components

| File / Script                  | Purpose                                                       |
|-------------------------------|---------------------------------------------------------------|
| `almasecure-ks.cfg`           | Main Kickstart file: partitioning, user, packages, services   |
| `postinstall.sh`              | Post-install automation: updates, SELinux, firewall setup     |
| `ks-generate.sh`              | Script to generate custom .cfg interactively                  |
| `README.md`                   | This file – module purpose and file overview                  |
| `info.md`                     | Final index with emoji tags and file map                     |

---

## 📌 Kickstart Design Choices

- Uses only **AlmaLinux-native tools**: Anaconda, DNF, firewalld
- Supports minimal and secure system base
- Adds automatic script callouts to AlmaSecure hardening logic

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
