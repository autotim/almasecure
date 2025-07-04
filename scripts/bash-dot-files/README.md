# 🧬 Bandit HUD v6 – Bash Prompt

> 🎨 A visually enhanced, Git-aware, SSH-sensitive, emoji-powered bash prompt for elite terminal warriors.

![badge](https://img.shields.io/badge/Prompt-HUD%20v6-brightgreen?style=flat-square)
![bash](https://img.shields.io/badge/Shell-Bash%20%3E=4.x-blue?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

---

## ✨ Features

- 🔐 SSH-aware: shows 🔏 if remote, 🔒 if local
- 🧠 Git HUD: shows branch, staged/unstaged, untracked, last commit hash + age
- 📁 Emoji path renderer: visualized PWD like `/home/user/repo/scripts`
- 🕒 Clock: time of each prompt
- 📘 `ghelp` function: view all productivity aliases from `.bash_aliases_productivity`

---

## 🧪 Preview

```bash
👤 bandit @ 🖥️  control.autotim.de 🔏
🕒 01:53 ⚙️ [dev] ✘ 🧪 0 🔧 2 🧼 2 ⛏️ a37277b ⏱ 0s 🧭 almasecure/scripts/bash-dot-files
📁 🗂️/home 📁/bandit 📂/almasecure 🗃️/scripts 🧾/bash-dot-files
➔
```

---

## 🚀 Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/autotim/almasecure/main/scripts/bash-dot-files/install.sh | bash
```

Then reload:
```bash
source ~/.bashrc
```

---

## 🛠 Structure

```bash
bash-dot-files/
├── bash_prompt         # Core PS1 logic (HUD v6)
└── install.sh          # Installs & links prompt + aliases
```

---

## 🧩 Bonus Aliases (optional)

Auto-added at `~/.bash_aliases_productivity`:

```bash
alias gs="git status"
alias gc="git commit -m"
alias gl="git log --oneline --graph"
alias gco="git checkout"
```

Then just run:
```bash
ghelp
```

---

## 📄 License
MIT — use it, fork it, brand it Blade-style 😎

---

## 📣 Credits
Engineered by **Bandit** | Terminal prompt by **Blade** ⚔️

> For dotfiles with DNA: 🧬 *Professionalism + Readability + Repo Hygiene = Project-Matrix™*
