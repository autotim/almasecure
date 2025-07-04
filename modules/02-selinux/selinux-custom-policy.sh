#!/bin/bash
# 🛠️ selinux-custom-policy.sh — Compile & load custom SELinux policy module
# AlmaSecure™ Project – Module 02: SELinux

set -euo pipefail

log() {
  echo -e "[\e[1;36mCUSTOM\e[0m] $1"
}

# 📁 Define module name and paths
MODULE_NAME="custom_local"
SRC_FILE="${MODULE_NAME}.te"
MOD_FILE="${MODULE_NAME}.mod"
PP_FILE="${MODULE_NAME}.pp"

# 📄 Check if .te source exists
if [[ ! -f "$SRC_FILE" ]]; then
  echo "[ERROR] Missing policy file: $SRC_FILE"
  echo "Create your SELinux policy in .te format first."
  exit 1
fi

# 🛠️ Compile and build policy
checkmodule -M -m -o "$MOD_FILE" "$SRC_FILE"
semodule_package -o "$PP_FILE" -m "$MOD_FILE"
semodule -i "$PP_FILE"

log "Policy module '$MODULE_NAME' compiled and installed successfully."

# 🧪 Validate install
semodule -l | grep "$MODULE_NAME" && log "✅ Module '$MODULE_NAME' is active."

exit 0
