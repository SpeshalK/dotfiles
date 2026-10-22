# Work laptop package setup

Run these in order on a fresh Fedora install.

## 1. Third-party repositories

```bash
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable atim/starship

sudo dnf install \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

## 2. Packages

```bash
grep -v '^#' pkgs-work.txt | xargs sudo dnf install
```

## 3. Manual installs

- **Zoom**: not in Fedora's repos. Use `flatpak install flathub us.zoom.Zoom`, or the RPM from zoom.us.

## 4. Shell

```bash
sudo usermod -s /bin/zsh $USER   # takes effect at next login
```

## 5. Optional (installed on demand, not by default)

- LaTeX: `sudo dnf install texlive-scheme-medium biber latexdiff`
- GIMP: `sudo dnf install gimp`
- Julia: juliaup (`curl -fsSL https://install.julialang.org | sh`)
- Python projects: `sudo dnf install uv`, then per-project venvs

## Notes

- OpenMPI is not on PATH by default: `module load mpi/openmpi-x86_64` (add to `~/.zshrc.local` to make it permanent).
