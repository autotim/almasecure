#!/usr/bin/env bash
# 🔧 Installer for Bandit HUD v6 (bash_prompt)
# Usage: curl -fsSL https://raw.githubusercontent.com/<user>/<repo>/main/scripts/bash-dot-files/install.sh | bash

set -e

echo "🧬 Installing Bandit HUD v6..."

BASH_PROMPT_URL="https://raw.githubusercontent.com/autotim/almasecure/main/scripts/bash-dot-files/bash_prompt"
TARGET="$HOME/.bash_prompt"
ALIAS_FILE="$HOME/.bash_aliases_productivity"

# Download the latest .bash_prompt
curl -fsSL "$BASH_PROMPT_URL" -o "$TARGET"
echo "✅ Installed to: $TARGET"

# Ensure ~/.bashrc sources it
if ! grep -qF ".bash_prompt" "$HOME/.bashrc"; then
  echo '[[ -f "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"' >> "$HOME/.bashrc"
  echo "✅ Linked to ~/.bashrc"
fi

# Create sample alias file if not exists
if [ ! -f "$ALIAS_FILE" ]; then
  cat > "$ALIAS_FILE" <<EOF
# ~/.bash_aliases_productivity
alias gs="git status"
alias gc="git commit -m"
alias gl="git log --oneline --graph"
alias gco="git checkout"
EOF
  echo "✅ Sample aliases created: $ALIAS_FILE"
fi

echo "🎉 Done! Reload with: source ~/.bashrc"
