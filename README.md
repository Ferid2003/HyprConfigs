# HyprConfigs

Core system / desktop configs for my Arch + Hyprland setup. Mirrors `~/.config`,
so deploying on a fresh machine is just a copy.

## What's here

| Dir | What |
|-----|------|
| `hypr` | Hyprland, hypridle, hyprlock + battery-alert script |
| `waybar` | Status bar |
| `rofi` | App launcher |
| `swaync` | Notification daemon |
| `kitty` | Terminal |
| `mpv` | Video player |
| `htop` | Process viewer |
| `gtk-3.0`, `gtk-4.0`, `nwg-look`, `xsettingsd` | Theming |

## Deploy on a new machine

```bash
git clone https://github.com/Ferid2003/HyprConfigs.git
cd HyprConfigs
cp -rn .config/* ~/.config/      # -n = don't clobber existing files
```

Install the matching packages first (not tracked here):

```bash
sudo pacman -S hyprland waybar rofi swaync kitty mpv htop nwg-look xsettingsd
# plus: a wallpaper daemon (awww), hypridle/hyprlock come with hyprland
```
