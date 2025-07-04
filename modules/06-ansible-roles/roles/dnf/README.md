# ⚙️ DNF Role – AlmaSecure™

> Harden and optimize DNF settings on AlmaLinux 9.6
> 🧬 Part of: `roles/dnf/`

---

## 🎯 Objective

- Optimize `/etc/dnf/dnf.conf` with safe defaults
- Enable rollback support (`tsflags=repackage`)
- Improve system performance and consistency

---

## 🧩 Included Files

| Path                | Purpose                                       |
|---------------------|-----------------------------------------------|
| `tasks/main.yml`    | Core logic for DNF configuration              |
| `defaults/main.yml` | Defines `dnf_enable_rollback` toggle          |
| `meta/main.yml`     | Role metadata for reuse and Galaxy compliance |

---

## ⚙️ Variables

| Variable              | Description                                 | Default |
|------------------------|---------------------------------------------|---------|
| `dnf_enable_rollback` | Enables `tsflags=repackage` in dnf.conf     | `true`  |

You can override it like this:
```yaml
dnf_enable_rollback: false
```

---

## 🔒 Applied Settings

```ini
fastestmirror=True
installonly_limit=3
keepcache=True
max_parallel_downloads=10
metadata_timer_sync=86400
defaultyes=True
tsflags=repackage  # only if enabled
```

---

## 🧬 Project-Matrix™ DNA

> Professionalism + Readability + Repo Hygiene  
> = 🧬 **Project-Matrix™ DNA**
