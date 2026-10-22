# dotfiles

My Fedora + Sway setup: a terminal-centric workflow built on Sway, Ghostty, zsh, Starship and Neovim. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level folder is a Stow package that mirrors where its files live under `~`:

| Package    | Links to                          |
|------------|-----------------------------------|
| `sway`     | `~/.config/sway/` (incl. lock/power scripts) |
| `waybar`   | `~/.config/waybar/`               |
| `ghostty`  | `~/.config/ghostty/`              |
| `starship` | `~/.config/starship.toml`         |
| `zsh`      | `~/.zshrc`                        |
| `nvim`     | `~/.config/nvim/`                 |

`packages/` is not stowed. It holds the package lists and install steps for a new machine.

## New machine

```bash
git clone git@github.com:SpeshalK/dotfiles.git ~/.dotfiles
```

1. Install packages: follow `packages/README.md`.
2. Link the configs:
   ```bash
   cd ~/.dotfiles
   stow sway waybar ghostty starship zsh nvim
   ```
3. Switch to zsh: `sudo usermod -s /bin/zsh $USER`, then log out and in.

If `stow` reports a conflict, an existing default config is in the way. Move it aside (e.g. `mv ~/.config/sway ~/.config/sway.orig`) and stow again.

## Machine-specific settings

Anything that differs between machines, or shouldn't be public, goes in `~/.zshrc.local`. It is sourced at the end of `.zshrc` if present, and git-ignored.

## Everyday use

Edit configs in their normal locations. The symlinks mean changes land in this repo. Then commit and push as usual.
