# Brand's Dotfiles

## What's in it

* WM: Openbox
* Panel: tint2
* Wallpaper manager: nitrogen
* System monitor: conky
* Openbox menus: obmenu-generator
* Application launcher: rofi
* Text processors: vim, emacs
* Terminal emulator: lxterminal, alacritty
* File managers: mc, pcmanfm, caja
* Sound volume: volumeicon
* Keyboard layout switcher: gxkb
* Clipboard manager: clipit
* Screensaver: xscreensaver
* X settings daemon: xsettingsd
* Calendar: gsimplecal
* Screenshots: scrot
* System font: Roboto Regular 11
* Monospace font: JetBrains Mono Medium
* GTK and Openbox theme: [Greylooks](https://github.com/vbrand1984/greylooks)
* Icons: Papirus-Light
* Mouse cursor: DMZ-White
* Miscellania: Caffeine-ng, Redshift

## Keybindings

### Openbox keybindings
TODO

### Dunst mouse configuraton
* Left click: Open context menu for actions and URLs.
* Right click: Close current notification.
* Middle click: Close all notifications.

## Features

### Supported distributions
These dotfiles are tested in Gentoo, Debian/Devuan and Void. Theoretically, this config should also work in other Debian-based distros (systemd-free included), and in Ubuntu and Ubuntu-based distributions as well, but not all features may be supported.

### Automatic installations of packages
In Debian-based distros, this config will automatically install needed packages using `aptitude`. The list of packages to install is stored in the `.chezmoidata/packages-deb.yml` file.

### Local bin directory
`~/.local/bin` is added in `$PATH` _after_ everything else. This directory contains severals scripts which have executable bit on.

### Most config files are readonly
Most of the configuration files managed by chezmoi here are `private_` and `readonly_`. The reason for that is not only security, but also convenience. This prevents user from accidently editing a config file which is managed by chezmoi. Instead, the `chedit` alias is defined in `bash` for the `chezmoi edit --apply` command. This command is also available via the `mc` user menu, just navigate your cursor over the desired file, press `F2` and `e`.

### Local scripts directory
Utility scripts without executable flag are stored in the `~/.Scripti` directory. Openbox pipemenu scripts are stored in `~/.Scripti/openbox-pipemenus`. All these scripts are invoked from other scripts directly, so that there is no need to add them in `$PATH`.

### The chezmoi.toml file
This config excessively abuses templating features of `chezmoi`. Many settings are stored in the `~/.config/chezmoi/chezmoi.toml` file which is defined by `.chezmoi.toml.tmpl`.

### Theming and fontconfig options
GTK options like theme, system font, mouse cursor theme, as well as fontconfig options like DPI, antialias and hinting are kept on a centralized basis in the `~/.config/chezmoi/chezmoi.toml` file in the `data.gtk` and `data.fontConfig` sections. One should not use programs like `lxappearance` in order to adjust these settings. Instead, edit the `chezmoi.toml` file, run `chezmoi apply` and `reconfigure-appearance.sh`, or just press `Super-Shift-A`.


## Caveats

* This config deletes several files in `~`, see the `.chezmoiremove` file. The reason for that is, configuration files for these programs are stored in `~/.config` instead.
* `~/.local/bin` and `~/.config/autostart` directories both have the `exact_` chezmoi's prefix which means that anything not managed by chezmoi in these directories will be deleted upon executing `chezmoi apply` or `chezmoi update`.
* Debian no longer supports `clipit` for whatever reason. As of now, I solve this issue by manually installing this package from Debian 10 and holding it (`aptitude hold` command). There is no automatic installation and support for this package so far.
