# btrbk backup workflow

Daily btrfs snapshots of `root` and `home`, sent incrementally to an encrypted external drive (the "vault"). Plus a weekly cleanup.

These files are **copied** into `/etc` and `/usr/local/bin` by `install.sh`, not stowed, so system files stay root-owned. After editing anything here, re-run the install.

| Machine  | Vault name   | Mount point   |
|----------|--------------|---------------|
| personal | `slopoVault` | `/slopoVault` |
| work     | `workVault`  | `/workVault`  |

## Install

```bash
sudo cryptsetup luksUUID /dev/sdX          # vault plugged in; find sdX with lsblk
sudo ./install.sh <vault-name> <luks-uuid>
```

## Daily use

- `btrbk run` happens automatically every hour (`btrbk.timer`). It always snapshots; if the vault is mounted it also backs up to it.
- To back up now: `vault-open`, then `sudo btrbk run` (or wait for the next hour), then `vault-close`.
- Check status: `sudo btrbk list latest`.

## New machine: one-time btrfs setup

Fedora's default install has `root` and `home` subvolumes but no top-level mount or snapshot subvolume. Before installing:

```bash
# Mount the top level of the btrfs filesystem
sudo mkdir -p /btrfs_pool
sudo mount -o subvolid=5 /dev/<root-partition> /btrfs_pool

# Create the snapshots subvolume and its folders
sudo btrfs subvolume create /btrfs_pool/snapshots
sudo mkdir -p /btrfs_pool/snapshots/{home,root}
```

Then add to `/etc/fstab` (UUID from `findmnt -no UUID /`):

```
UUID=<uuid> /btrfs_pool  btrfs  compress=zstd:3  0 0
UUID=<uuid> /snapshots   btrfs  subvol=snapshots,compress=zstd:3  0 0
```

On a **new vault drive**: format it with LUKS and btrfs, then create `snapshots/home` and `snapshots/root` on it.

```bash
sudo cryptsetup luksFormat /dev/sdX
sudo cryptsetup open /dev/sdX workVault
sudo mkfs.btrfs -L workVault /dev/mapper/workVault
sudo mkdir -p /workVault && sudo mount /dev/mapper/workVault /workVault
sudo btrfs subvolume create /workVault/snapshots
sudo mkdir -p /workVault/snapshots/{home,root}
```
