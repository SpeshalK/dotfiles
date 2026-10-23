#!/bin/bash
# Install the btrbk backup workflow on this machine.
#
# Usage:  sudo ./install.sh <vault-name> <luks-uuid>
#   e.g.  sudo ./install.sh slopoVault 1234abcd-....
#
# Find the UUID with:  sudo cryptsetup luksUUID /dev/sdX   (vault plugged in)
set -euo pipefail

if [ "$EUID" -ne 0 ] || [ $# -ne 2 ]; then
    echo "Usage: sudo $0 <vault-name> <luks-uuid>" >&2
    exit 1
fi

VAULT_NAME="$1"
VAULT_UUID="$2"
SRC="$(cd "$(dirname "$0")" && pwd)"

fill() {
    sed -e "s|@VAULT_MOUNT@|/$VAULT_NAME|g" \
        -e "s|@VAULT_NAME@|$VAULT_NAME|g" \
        -e "s|@VAULT_UUID@|$VAULT_UUID|g" "$1"
}

# 1. btrbk config (keep a backup of any existing one)
mkdir -p /etc/btrbk
if [ -f /etc/btrbk/btrbk.conf ]; then
    cp /etc/btrbk/btrbk.conf "/etc/btrbk/btrbk.conf.bak.$(date +%Y%m%d%H%M%S)"
fi
fill "$SRC/btrbk.conf" > /etc/btrbk/btrbk.conf
chmod 644 /etc/btrbk/btrbk.conf

# 2. Scripts
install -m 755 "$SRC/bin/sys-cleanup.sh" /usr/local/bin/sys-cleanup.sh
fill "$SRC/bin/vault-open.sh"  > /usr/local/bin/vault-open
fill "$SRC/bin/vault-close.sh" > /usr/local/bin/vault-close
chmod 755 /usr/local/bin/vault-open /usr/local/bin/vault-close

# 3. Systemd units (btrbk.service/.timer ship with the btrbk package;
#    we only add drop-ins: hourly schedule, vault-optional exit code)
install -m 644 "$SRC/systemd/cleanup.service" /etc/systemd/system/
install -m 644 "$SRC/systemd/cleanup.timer"   /etc/systemd/system/
install -d /etc/systemd/system/btrbk.timer.d /etc/systemd/system/btrbk.service.d
install -m 644 "$SRC/systemd/btrbk.timer.d/hourly.conf" /etc/systemd/system/btrbk.timer.d/
install -m 644 "$SRC/systemd/btrbk.service.d/vault-optional.conf" /etc/systemd/system/btrbk.service.d/
systemctl daemon-reload

# Retire the old cron job if present (systemd timer replaces it)
if [ -f /etc/cron.hourly/btrbk-snapshot ]; then
    mv /etc/cron.hourly/btrbk-snapshot /etc/btrbk/cron-btrbk-snapshot.retired
    echo "Moved old cron job to /etc/btrbk/cron-btrbk-snapshot.retired"
fi
systemctl enable --now btrbk.timer cleanup.timer

# 4. Sanity check
echo
echo "Installed for vault '$VAULT_NAME'. Checking config:"
btrbk dryrun || echo "(dryrun reported problems; expected if the vault isn't mounted)"
systemctl list-timers btrbk.timer cleanup.timer
