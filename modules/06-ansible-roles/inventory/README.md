# 📘 inventory/README.md – Ansible Inventory

> Define which nodes receive the AlmaSecure™ hardening

---

## 🗂️ Group: `[secure_nodes]`

This group is used in `site.yml` to apply all roles. Customize as needed:

```ini
[secure_nodes]
secure-node.alma.local ansible_user=root ansible_port=22
```

---

## ✏️ You Can Customize:
- IP instead of hostname
- Add SSH key auth
- Use `ansible_host=IP`, `ansible_ssh_private_key_file=~/.ssh/key`
- Override default port or user

---

## 🧬 Project-Matrix™ DNA
> Professionalism + Readability + Repo Hygiene = 🧬
