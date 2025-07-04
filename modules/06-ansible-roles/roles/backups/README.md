# 💾 Backups Role – AlmaSecure™

> Protect essential configs and files with rsync-based backups  
> 🧬 Part of: `roles/backups/`

---

## 🎯 Objective

- Create reliable, local backups using `rsync`
- Allow easy customization of source/destination
- Simple toggles for backup enable/disable

---

## 🧩 Included Files

| Path                | Purpose                                          |
|---------------------|--------------------------------------------------|
| `tasks/main.yml`    | Core logic for performing rsync backups         |
| `defaults/main.yml` | Default backup settings                         |
| `meta/main.yml`     | Metadata for Galaxy + platform support          |

---

## 🎛️ Variables

| Variable              | Description                                 | Default              |
|------------------------|---------------------------------------------|----------------------|
| `backup_enabled`       | Whether the backup logic runs                | `true`               |
| `backup_source`        | Directory to back up                         | `/etc`               |
| `backup_destination`   | Where backups are stored                     | `/var/backups/etc`   |

---

## 🔄 Backup Flow

```bash
rsync -aAXv --delete /etc /var/backups/etc
```

- `-aAXv`: archive + ACLs + xattrs + verbose
- `--delete`: ensures removed files are purged from backup

---

## 📌 Notes

- The role **does not** include versioning or remote sync yet
- Intended for quick restore points on hardened systems
- Easily integrated into cron or systemd timers

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
