
<p align="center">
  <img src="dwm.png" alt="dwm" width="80" />
</p>

<h1 align="center">dwm — dynamic window manager</h1>

<p align="center">
  <b>A fast, tiny, and dynamic window manager for X</b><br>
  <sub>Personal build with custom patches, keybindings, and scripts</sub>
</p>

<p align="center">
  <a href="README_CN.md">中文</a>
  &nbsp;·&nbsp;
  <a href="#installation">Install</a>
  &nbsp;·&nbsp;
  <a href="#keybindings">Keybindings</a>
  &nbsp;·&nbsp;
  <a href="#customization">Customization</a>
  &nbsp;·&nbsp;
  <a href="#license">License</a>
</p>

---

## Overview

[dwm](https://dwm.suckless.org) is a dynamic window manager for X. It manages windows in **tiled**, **monocle**, and **floating** layouts. All layouts can be applied on the fly, adapting to the application and task at hand.

This is a personal build of **dwm 6.8** with custom modifications:

- Dynamic color scheme powered by **pywal16**
- Media keys for **brightness** and **volume** control with Dunst notifications
- **Screenshot** utilities bound to function keys
- **Actual fullscreen** patch (proper fullscreen without the statusbar)
- **kitty** as the default terminal
- **Super** key as the primary modifier

---

## Requirements

- Xlib header files
- Xinerama *(optional)*
- libXft & fontconfig
- `brightnessctl` — for brightness scripts
- `pactl` (PipeWire/PulseAudio) — for volume scripts
- `scrot` — for screenshots
- `dunst` — for on-screen notifications
- `dmenu` — application launcher
- `kitty` — default terminal

---

## Installation

Edit `config.mk` to adjust paths for your system, then:

```sh
make clean install
```

If you need root privileges:

```sh
sudo make clean install
```

---

## Running dwm

Add the following line to your `.xinitrc` to start dwm via `startx`:

```sh
exec dwm
```

To display dynamic status info in the bar:

```sh
while xsetroot -name "$(date)"
do
    sleep 1
done &
exec dwm
```

---

## Layouts

| Symbol | Layout    | Description                                      |
|--------|-----------|--------------------------------------------------|
| `[ ]=` | Tiled     | Master area (left) + stacking area (right)        |
| `><>`  | Floating  | Windows can be moved and resized freely           |
| `[M]`  | Monocle   | Focused window maximized to full screen           |

The floating layout is automatically applied to dialog windows.

---

## Keybindings

> **Mod** = `Super` (Windows key)

### Launching

| Binding              | Action                          |
|----------------------|---------------------------------|
| `Mod + Return`       | Zoom / swap focused window      |
| `Mod + Shift + Return` | Launch terminal (kitty)       |
| `Mod + d`            | Launch dmenu                    |

### Window Management

| Binding              | Action                          |
|----------------------|---------------------------------|
| `Mod + j`            | Focus next window               |
| `Mod + k`            | Focus previous window           |
| `Mod + Shift + i`    | Increase master area count      |
| `Mod + Shift + d`    | Decrease master area count      |
| `Mod + h`            | Shrink master area              |
| `Mod + l`            | Expand master area              |
| `Mod + Shift + q`    | Kill focused window             |
| `Mod + Shift + space` | Toggle floating                |
| `Mod + Shift + f`    | Toggle actual fullscreen        |

### Layout Switching

| Binding              | Action                          |
|----------------------|---------------------------------|
| `Mod + t`            | Tiled layout                    |
| `Mod + f`            | Floating layout                 |
| `Mod + m`            | Monocle layout                  |
| `Mod + space`        | Toggle last layout              |

### Tags

| Binding                              | Action                          |
|--------------------------------------|---------------------------------|
| `Mod + [1–9]`                        | View tag                        |
| `Mod + Shift + [1–9]`                | Move window to tag              |
| `Mod + Ctrl + [1–9]`                 | Toggle tag in view              |
| `Mod + Ctrl + Shift + [1–9]`         | Toggle tag on window            |
| `Mod + 0`                            | View all tags                   |
| `Mod + Shift + 0`                    | Apply all tags                  |
| `Mod + Tab`                          | Toggle previous tags            |

### Multi-Monitor

| Binding              | Action                          |
|----------------------|---------------------------------|
| `Mod + ,`            | Focus previous monitor          |
| `Mod + .`            | Focus next monitor              |
| `Mod + Shift + ,`    | Move window to previous monitor |
| `Mod + Shift + .`    | Move window to next monitor     |

### System & Media

| Binding              | Action                          |
|----------------------|---------------------------------|
| `F2`                 | Fullscreen screenshot           |
| `Shift + F2`         | Area screenshot                 |
| `BrightnessUp`       | Increase brightness (+5%)       |
| `BrightnessDown`     | Decrease brightness (-5%)       |
| `VolumeUp`           | Raise volume (+5%)              |
| `VolumeDown`         | Lower volume (-5%)              |
| `VolumeMute`         | Toggle mute                     |
| `Mod + Shift + e`    | Quit dwm                        |

---

## Mouse Actions

| Binding              | Action                              |
|----------------------|-------------------------------------|
| `Button1` on tag     | View that tag                       |
| `Button3` on tag     | Toggle tag in view                  |
| `Mod + Button1` on tag | Apply tag to focused window       |
| `Mod + Button3` on tag | Toggle tag on focused window      |
| `Button1` on layout  | Cycle layouts                       |
| `Button3` on layout  | Monocle layout                      |
| `Mod + Button1` on window | Move window                   |
| `Mod + Button2` on window | Toggle floating               |
| `Mod + Button3` on window | Resize window                 |

---

## Project Structure

```
dwm/
├── dwm.c                  # Core source (2173+ lines)
├── drw.c / drw.h          # Drawing abstraction layer
├── util.c / util.h        # Utility macros & helpers
├── transient.c            # Transient window test program
├── config.def.h           # Default configuration template
├── config.h               # Active configuration (customized)
├── config.mk              # Build configuration & dependencies
├── Makefile               # Build system
├── dwm.1                  # Man page
├── dwm.png                # Icon
├── LICENSE                # MIT/X Consortium License
├── colorscheme/
│   └── colors-wal-dwm.h   # pywal16 dynamic color scheme
├── patches/
│   └── dwm-actualfullscreen-*.diff  # Fullscreen patch
├── scripts/
│   ├── brightness.sh       # Brightness control + notification
│   ├── volume.sh           # Volume control + notification
│   ├── screenshot.sh       # Fullscreen screenshot
│   └── screenshotsel.sh    # Area screenshot
└── wallpaper/
    └── 1.png               # Custom wallpaper
```

---

## Customization

dwm is configured at compile time by editing `config.h` and rebuilding:

```sh
make clean install
```

Key areas you can tweak:

- **`MODKEY`** — Modifier key (`Mod1Mask` = Alt, `Mod4Mask` = Super)
- **`fonts[]`** — Status bar fonts
- **`colors[][]`** — Color scheme (imported from `colorscheme/`)
- **`tags[]`** — Tag labels
- **`rules[]`** — Per-application rules (floating, tag placement)
- **`keys[]`** — Keyboard shortcuts
- **`buttons[]`** — Mouse bindings
- **`layouts[]`** — Available layouts
- **`mfact`** — Master area width ratio (default 0.55)
- **`borderpx`** — Window border width

---

## Patches Applied

| Patch               | Description                                         |
|---------------------|-----------------------------------------------------|
| **actualfullscreen** | True fullscreen using `_NET_WM_STATE_FULLSCREEN`, not just monocle + statusbar hide |

---

## License

MIT/X Consortium License — See [LICENSE](LICENSE) for details.

---

<p align="center">
  <sub>Built with <code>keep it simple, stupid</code> in mind &mdash; <a href="https://suckless.org">suckless.org</a></sub>
</p>
