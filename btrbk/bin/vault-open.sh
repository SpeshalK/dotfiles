#!/bin/bash
# Unlock and mount the backup vault. Installed as /usr/local/bin/vault-open.
# @VAULT_NAME@ and @VAULT_UUID@ are filled in by install.sh.
set -euo pipefail

VAULT_NAME="@VAULT_NAME@"
VAULT_UUID="@VAULT_UUID@"
DEVICE="/dev/disk/by-uuid/$VAULT_UUID"
MOUNT="/$VAULT_NAME"

if [ ! -e "$DEVICE" ]; then
    echo "Vault drive not found ($DEVICE). Is it plugged in and powered on?" >&2
    exit 1
fi

if mountpoint -q "$MOUNT"; then
    echo "$VAULT_NAME is already open at $MOUNT."
    exit 0
fi

# Reuse an existing unlocked mapping (e.g. opened by udiskie or an old script)
MAPPER="$(lsblk -nro NAME,TYPE "$DEVICE" | awk '$2 == "crypt" { print $1; exit }')"
if [ -z "$MAPPER" ]; then
    sudo cryptsetup open "$DEVICE" "$VAULT_NAME"
    MAPPER="$VAULT_NAME"
fi

sudo mkdir -p "$MOUNT"
sudo mount "/dev/mapper/$MAPPER" "$MOUNT"

echo "$VAULT_NAME setup complete...baby."
