#!/bin/bash
# Weekly system cleanup, run as root by cleanup.service.

dnf clean all
journalctl --vacuum-time=7d

if command -v flatpak &> /dev/null; then
    flatpak uninstall --unused -y
fi

# Rebalance nearly-empty btrfs chunks to reclaim space
btrfs balance start -dusage=10 -musage=10 /

# Clear thumbnails older than 30 days for every user
# (runs as root, so ~ would mean /root; target /home/* explicitly)
find /home/*/.cache/thumbnails -type f -atime +30 -delete 2>/dev/null || true
