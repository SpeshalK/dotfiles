#!/bin/bash
# Unmount, lock and power off the backup vault. Installed as /usr/local/bin/vault-close.
# @VAULT_NAME@ and @VAULT_UUID@ are filled in by install.sh.
set -euo pipefail

VAULT_NAME="@VAULT_NAME@"
VAULT_UUID="@VAULT_UUID@"
DEVICE="/dev/disk/by-uuid/$VAULT_UUID"
MOUNT="/$VAULT_NAME"

if [ ! -e "$DEVICE" ]; then
    echo "Vault drive not present; nothing to close."
    exit 0
fi

if mountpoint -q "$MOUNT"; then
    sudo umount "$MOUNT"
fi

# Lock whatever mapping sits on the drive, whatever it was named
MAPPER="$(lsblk -nro NAME,TYPE "$DEVICE" | awk '$2 == "crypt" { print $1; exit }')"
if [ -n "$MAPPER" ]; then
    sudo cryptsetup close "$MAPPER"
fi

udisksctl power-off -b "$DEVICE"

echo "$VAULT_NAME safely shutdown...baby."
