# The Dotfiles

These are my personal dotfiles which I desided to publish.

## Installation

Install [chezmoi](https://www.chezmoi.io/install/).

Clone the contents of this repository in `~/.Dots/chezmoi` (NB: specifying this directory is a must):

```
chezmoi init vbrand1984 --source ~/.Dots/chezmoi
```

See what files are going to be changed upon applying this configuration:

```
chezmoi status
```

See detailed differences in the files managed by this configuration (there will be a lot):

```
chezmoi diff
```

Apply the configuration:

```
chezmoi apply
```

## Screenshot(s)

![A screenshot](../assets/screenshots/screenshot01-gentoo.png?raw=true)

## List of Used Programs and Theming Packages

<details>
  <summary>Expand</summary>

<table>
    <tr><th colspan="2">Applications and utilities</th></tr>
    <tr><td>Dotfiles manager</td><td><a href="https://www.chezmoi.io/">chezmoi</a></td></tr>
    <tr><td>Window manager</td><td><a href="https://github.com/danakj/openbox">Openbox</a></td></tr>
    <tr><td>Panel</td><td><a href="https://github.com/o9000/tint2">Tint2</a></td></tr>
    <tr><td>X Compositor</td><td><a href="https://github.com/yshui/picom">picom</a></td></tr>
    <tr><td>Wallpaper manager</td><td><a href="https://github.com/l3ib/nitrogen">nitrogen</a></td></tr>
    <tr><td>System monitor</td><td><a href="https://github.com/brndnmtthws/conky">Conky</a></td></tr>
    <tr><td>Openbox menus</td><td><a href="https://github.com/trizen/obmenu-generator">obmenu-generator</a></td></tr>
    <tr><td>Application launcher</td><td><a href="https://github.com/davatorium/rofi">rofi</a></td></tr>
    <tr><td>Text processors</td><td><a href="https://github.com/vim/vim">Vim</a>, <a href="https://www.gnu.org/software/emacs/">Emacs</a></td></tr>
    <tr><td>Terminal emulator</td><td><a href="https://github.com/lxde/lxterminal">LXTerminal</a>, <a href="https://github.com/alacritty/alacritty">Alacritty</a></td></tr>
    <tr><td>File managers</td><td><a href="https://midnight-commander.org/">mc</a>, <a href="https://github.com/lxde/pcmanfm">PCManFM</a> or <a href="https://github.com/mate-desktop/caja">caja</a></td></tr>
    <tr><td>Sound volume</td><td><a href="https://github.com/Maato/volumeicon">volumeicon</a></td></tr>
    <tr><td>Clipboard manager</td><td><a href="https://github.com/CristianHenzel/ClipIt">ClipIt</a></td></tr>
    <tr><td>Screensaver</td><td><a href="https://www.jwz.org/xscreensaver/">XScreensaver</a></td></tr>
    <tr><td>X settings daemon</td><td><a href="https://codeberg.org/derat/xsettingsd">XSettingsD</a></td></tr>
    <tr><td>Calendar</td><td><a href="https://github.com/dmedvinsky/gsimplecal">Gsimplecal</a></td></tr>
    <tr><td>Screenshots</td><td><a href="https://github.com/dreamer/scrot">Scrot</a></td></tr>
    <tr><td>Miscellania</td><td><a href="https://codeberg.org/WhyNotHugo/caffeine-ng">Caffeine-ng</a>, <a href="https://github.com/jonls/redshift">Redshift</a></td></tr>
    <tr><th colspan="2">Theming</th></tr>
    <tr><td>GTK and Openbox theme</td><td><a href="https://github.com/vbrand1984/greylooks">Greylooks</a></td></tr>
    <tr><td>Icons</td><td><a href="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme">Papirus-Light</a></td></tr>
    <tr><td>Mouse cursor</td><td>DMZ-White a.k.a. Vanilla-DMZ</td></tr>
    <tr><td>System font</td><td>Roboto Regular 11</td></tr>
    <tr><td>Monospace font</td><td>JetBrains Mono Medium</td></tr>
    <tr><td>Other fonts used</td><td>Ubuntu, DejaVu</td></tr>
</table>

</details>

## Cheatsheet

### Openbox keybindings

<details>
  <summary>Expand</summary>

<table>
    <tr>
        <th colspan="2">Application launchers</th>
    </tr>
    <tr><td>Super-Ctrl-B</td><td>Web Browser</td></tr>
    <tr><td>Super-Ctrl-C</td><td>LibreOffice Calc</td></tr>
    <tr><td>Super-Ctrl-E</td><td>Emacs client</td></tr>
    <tr><td>Super-Ctrl-F</td><td>File manager</td></tr>
    <tr><td>Super-Ctrl-I</td><td>LibreOffice Impress</td></tr>
    <tr><td>Super-Ctrl-O</td><td>Obconf</td></tr>
    <tr><td>Super-Ctrl-P</td><td>Pavucontrol</td></tr>
    <tr><td>Super-Ctrl-Q</td><td>Qalculate!</td></tr>
    <tr><td>Super-Ctrl-R</td><td>Tor Browser launcher</td></tr>
    <tr><td>Super-Ctrl-S</td><td>OBS-Studio</td></tr>
    <tr><td>Super-Ctrl-T</td><td>Terminal emulator</td></tr>
    <tr><td>Super-Ctrl-W</td><td>LibreOffice Writer</td></tr>
    <tr><td>Ctrl-Alt-Del</td><td>System monitor</td></tr>
    <tr>
        <th colspan="2">rofi</th>
    </tr>
    <tr><td>Super-Enter</td><td>run module (run a command)</td></tr>
    <tr><td>Super-Shift-Enter</td><td>drun module (run desktop application)</td></tr>
    <tr><td>Super-F1</td><td>calc module (not working in Debian-based installs)</td></tr>
    <tr><td>Super-Tab</td><td>window switching module</td></tr>
    <tr>
        <th colspan="2">Screenshots</th>
    </tr>
    <tr><td>PrtScr</td><td>Take a screenshot (fullscreen)</td></tr>
    <tr><td>Alt-PrtScr</td><td>Screenshot of the current window</td></tr>
    <tr><td>Ctrl-PrtScr</td><td>Screenshot of selection</td></tr>
    <tr><td>Super-PrtScr</td><td>Fullscreen screenshot with a 5 sec delay</td></tr>
    <tr><td>Super-Alt-PrtScr</td><td>Screenshot of the current window with a 5 sec delay</td></tr>
    <tr>
        <th colspan="2">Inherent Openbox stuff</th>
    </tr>
    <tr><td>Super-Shift-A</td><td>Reconfigure whole appearance</td></tr>
    <tr><td>Super-Shift-C</td><td>Reconfigure Openbox</td></tr>
    <tr><td>Super-Esc</td><td>Show Openbox menu</td></tr>
    <tr><td>Super-D</td><td>Show/hide desktop</td></tr>
    <tr>
        <th colspan="2">Session management</th>
    </tr>
    <tr><td>Super-Ctrl-L</td><td>Lock screen</td></tr>
    <tr><td>Super-Ctrl-Esc</td><td>Shutdown dialogue</td></tr>
    <tr><td>Super-Shift-Esc</td><td>Exit Openbox</td></tr>
    <tr>
        <th colspan="2">Navigating between desktops</th>
    </tr>
    <tr><td>Super-[1..4]</td><td>Go to desktop 1, 2, 3 or 4</td></tr>
    <tr><td>Super-Ctrl-Left</td><td>Go to the desktop to the left</td></tr>
    <tr><td>Super-Ctrl-Right</td><td>Go to the desktop to the right</td></tr>
    <tr><td>Super-Ctrl-Up</td><td>Go to the desktop above</td></tr>
    <tr><td>Super-Ctrl-Down</td><td>Go to the desktop below</td></tr>
    <tr>
        <th colspan="2">Moving windows between desktops</th>
    </tr>
    <tr><td>Super-Shift-[1..4]</td><td>Move current window to desktop 1, 2, 3 or 4</td></tr>
    <tr><td>Super-Shift-Left</td><td>Move current window to the desktop to the left</td></tr>
    <tr><td>Super-Shift-Right</td><td>Move current window to the desktop to the right</td></tr>
    <tr><td>Super-Shift-Up</td><td>Move current window to the desktop above</td></tr>
    <tr><td>Super-Shift-Down</td><td>Move current window to the desktop below</td></tr>
    <tr>
        <th colspan="2">Window handling</th>
    </tr>
    <tr><td>Alt-F4, Super-Q</td><td>Close current window</td></tr>
    <tr><td>Alt-Esc</td><td>Drown the window into the bottom of the stack</td></tr>
    <tr><td>Alt-Space</td><td>Show window&#39;s context menu</td></tr>
    <tr><td>Super-F</td><td>Toggle fullscreen</td></tr>
    <tr><td>Super-I</td><td>Iconify current window</td></tr>
    <tr><td>Super-M</td><td>Toggle maximize</td></tr>
    <tr><td>Super-O</td><td>Toggle omnipresent</td></tr>
    <tr><td>Alt-Tab</td><td>Switch to the next window</td></tr>
    <tr><td>Ctrl-Alt-Tab</td><td>Switch to the previous window</td></tr>
    <tr>
        <th colspan="2">(Semi)-Tiling</th>
    </tr>
    <tr><td>Super-Left</td><td>Shift current window to the left half of the screen</td></tr>
    <tr><td>Super-Right</td><td>Shift current window to the right half of the screen</td></tr>
    <tr><td>Super-Up</td><td>Shift current window to the top half of the screen</td></tr>
    <tr><td>Super-Down</td><td>Shift current window to the bottom half of the screen</td></tr>
    <tr><td>Super-Home</td><td>Shift current window to the upper-left corner of the screen</td></tr>
    <tr><td>Super-PageUp</td><td>Shift current window to the upper-right corner of the screen</td></tr>
    <tr><td>Super-PageDown</td><td>Shift current window to the bottom-right corner of the screen</td></tr>
    <tr><td>Super-End</td><td>Shift current window to the bottom-left corner of the screen</td></tr>
</table>

</details>

### Dunst mouse bindings

<details>
  <summary>Expand</summary>

* Left click: Open context menu for actions and URLs.
* Right click: Close current notification.
* Middle click: Close all notifications.

</details>

## Features

### Supported distributions
These dotfiles are tested in Gentoo, Debian/Devuan and Void Linux. Theoretically, this config should also work in other Debian-based distros (non-systemd ones included), and in Ubuntu and Ubuntu-based distributions as well, but not all features may be supported.

The dotfiles are managed by [chezmoi](https://www.chezmoi.io/). In Void Linux, the package for chezmoi is in the official repository; in Gentoo, there is an ebuild in the guru overlay. There is no official support for chezmoi in Debian though. One can install chezmoi in Debian and Debian-based distros in different ways. Personally, I prefer manual installation of the prebuilt `.deb` package ([link](https://www.chezmoi.io/install/#download-a-pre-built-linux-package)). After that it is possible to update chezmoi by running `chezmoi upgrade` (see the [docs](https://www.chezmoi.io/reference/commands/upgrade/)).  

### Automated installation of packages
In Debian-based distros, this config will automatically install needed packages using `aptitude`. The list of the packages to install is stored in the [`$CHEZMOI_SOURCE_DIR/.chezmoidata/packages-debian.yaml`](home/.chezmoidata/packages-deb.yaml) file. Further package installation and configuration is performed by my ansible playbook (WIP).

### Local bin directory
`~/.local/Bin` is added in `$PATH` _after_ everything else. This directory contains several scripts which have executable bit on.

`~/.local/Bin` has the `exact_` chezmoi's prefix in the config** (see the [docs](https://www.chezmoi.io/reference/source-state-attributes/)) which means that anything not managed by chezmoi in this directory will be deleted upon executing `chezmoi init --apply`, `chezmoi update` or `chezmoi apply`. If this behaviour is undesirable, rename the directory in the chezmoi source directory and wipe off the `exact_` prefix before applying the configuration.

The name `~/.local/Bin` was chosen deliberately because this path does not belong to any known to me standard, so that this config doesn't touch the `~/bin` and `~/.local/bin` directories.

### Local scripts directories
Utility scripts without executable flag are stored in the [`~/.local/Scripti`](home/exact_private_dot_Scripti) directory. Openbox pipemenu scripts are stored in [`~/.local/Scripti/openbox-pipemenus`](home/exact_private_dot_Scripti/exact_private_openbox-menus). All these scripts are invoked from other scripts directly, so that there is no need to either add them in `$PATH` or enable executable bit at all.

These directories both have the `exact_` prefix in the config as well.

### Most config files are readonly
Most of the configuration files managed by chezmoi here are `private_` and `readonly_`. The reason for that is not only security, but also convenience. This prevents user from accidently editing a config file which is managed by chezmoi. Instead, the `chedit` alias is defined in `bash` for the `chezmoi edit --apply` command. This command is also available via the `mc` user menu: just navigate your cursor over the desired file, press `F2` and `e`.

### The chezmoi.toml file
This config excessively abuses templating features of chezmoi. Many settings are stored in the main configuration file of chezmoi, `~/.config/chezmoi/chezmoi.toml` (see the [docs](https://www.chezmoi.io/reference/configuration-file/)), which is defined by [`$CHEZMOI_SOURCE_DIR/.chezmoi.toml.tmpl`](home/.chezmoi.toml.tmpl) (see the [docs](https://www.chezmoi.io/reference/special-files-and-directories/chezmoi-format-tmpl/)).

### Theming and fontconfig options
GTK options like theme, system font, mouse cursor theme, as well as fontconfig options like DPI, antialias and hinting are kept on a centralized basis in the `~/.config/chezmoi/chezmoi.toml` file in the `data.gtk` and `data.fontConfig` sections. One should not use programs like `lxappearance` in order to adjust these settings. Instead, edit the `~/.config/chezmoi/chezmoi.toml` file, run `chezmoi apply` and [`reconfigure-appearance.sh`](home/private_dot_local/exact_private_bin/private_readonly_executable_reconfigure-appearance.sh.tmpl) (or just press `Super-Shift-A` in order to invoke this script).

The default [Greylooks](https://github.com/vbrand1984/greylooks) GTK and Openbox theme is downloaded and installed in the `~/.local/share/themes` directory automatically upon applying the configuration.

## Caveats

* This config **may delete several config files in `$HOME`**, see the [`$CHEZMOI_SOURCE_DIR/.chezmoiremove`](home/.chezmoiremove) file for more details. The reason for that is, configuration files for these programs are stored inside the `~/.config` directory instead (and Vim config is stored in `~/.vim`).
* Git configuration is also affected. The `~/.gitconfig` and `./git-credentials` files are deleted, and the `~/.config/git/config` file is created according to its template. Thus, be sure you've backed up your git configuration before applying these dotfiles!
* The `~/.config/autostart` directory **has the `exact_` chezmoi's prefix in the config** which means that **anything not managed by chezmoi in it will be deleted** upon executing `chezmoi init --apply`, `chezmoi update` or `chezmoi apply` (this is done partly for security, partly for convenience reasons). You have been warned.
* `~/.local/Bin` and `~/.local/Scripti` directories both have the same `exact_` prefix in the config, as well. Though these are just my personal directories, and they are not included in any standards.

## License
This project is free software and is published under the terms of the [GPL-2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) license.

The project is provided AS IS and WITHOUT ANY WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
