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

## Cheatsheet

### Openbox keybindings

<details>
  <summary>Show Openbox keybindings</summary>

<table>
    <tr>
        <th colspan="2">Application launchers</th>
    </tr>
    <tr>
        <td>Super-Ctrl-B</td>
        <td>Web Browser</td>
    </tr>
    <tr>
        <td>Super-Ctrl-C</td>
        <td>LibreOffice Calc</td>
    </tr>
    <tr>
        <td>Super-Ctrl-E</td>
        <td>Emacs client</td>
    </tr>
    <tr>
        <td>Super-Ctrl-F</td>
        <td>File manager</td>
    </tr>
    <tr>
        <td>Super-Ctrl-I</td>
        <td>LibreOffice Impress</td>
    </tr>
    <tr>
        <td>Super-Ctrl-O</td>
        <td>Obconf</td>
    </tr>
    <tr>
        <td>Super-Ctrl-P</td>
        <td>Pavucontrol</td>
    </tr>
    <tr>
        <td>Super-Ctrl-R</td>
        <td>Tor Browser launcher</td>
    </tr>
    <tr>
        <td>Super-Ctrl-S</td>
        <td>OBS-Studio</td>
    </tr>
    <tr>
        <td>Super-Ctrl-T</td>
        <td>Terminal emulator</td>
    </tr>
    <tr>
        <td>Super-Ctrl-W</td>
        <td>LibreOffice Writer</td>
    </tr>
    <tr>
        <td>Ctrl-Alt-Del</td>
        <td>System monitor</td>
    </tr>
    <tr>
        <th colspan="2">rofi</th>
    </tr>
    <tr>
        <td>Super-F1</td>
        <td>calc module (not working in Debian-based installs)</td>
    </tr>
    <tr>
        <td>Super-Tab</td>
        <td>window switching module</td>
    </tr>
    <tr>
        <td>Super-Enter</td>
        <td>run module</td>
    </tr>
    <tr>
        <td>Super-Shift-Enter</td>
        <td>drun module</td>
    </tr>
    <tr>
        <th colspan="2">Screenshots</th>
    </tr>
    <tr>
        <td>PrtScr</td>
        <td>Take a screenshot (fullscreen)</td>
    </tr>
    <tr>
        <td>Alt-PrtScr</td>
        <td>Screenshot of the current window</td>
    </tr>
    <tr>
        <td>Ctrl-PrtScr</td>
        <td>Screenshot of selection</td>
    </tr>
    <tr>
        <td>Super-PrtScr</td>
        <td>Fullscreen screenshot with a 5 sec delay</td>
    </tr>
    <tr>
        <td>Super-Alt-PrtScr</td>
        <td>Screenshot of the current window with a 5 sec delay</td>
    </tr>
    <tr>
        <th colspan="2">Inherent Openbox stuff</th>
    </tr>
    <tr>
        <td>Super-Shift-A</td>
        <td>Reconfigure whole appearance</td>
    </tr>
    <tr>
        <td>Super-Shift-C</td>
        <td>Reconfigure Openbox</td>
    </tr>
    <tr>
        <td>Super-Esc</td>
        <td>Show Openbox menu</td>
    </tr>
    <tr>
        <td>Super-D</td>
        <td>Show/hide desktop</td>
    </tr>
    <tr>
        <th colspan="2">Session management</th>
    </tr>
    <tr>
        <td>Super-Ctrl-L</td>
        <td>Lock screen</td>
    </tr>
    <tr>
        <td>Super-Ctrl-Q</td>
        <td>Shutdown dialogue</td>
    </tr>
    <tr>
        <td>Super-Shift-Q</td>
        <td>Exit Openbox</td>
    </tr>
    <tr>
        <th colspan="2">Navigating between desktops</th>
    </tr>
    <tr>
        <td>Super-[1..4]</td>
        <td>Go to desktop 1, 2, 3 or 4</td>
    </tr>
    <tr>
        <td>Super-Ctrl-Left</td>
        <td>Go to the desktop to the left</td>
    </tr>
    <tr>
        <td>Super-Ctrl-Right</td>
        <td>Go to the desktop to the right</td>
    </tr>
    <tr>
        <td>Super-Ctrl-Up</td>
        <td>Go to the desktop above</td>
    </tr>
    <tr>
        <td>Super-Ctrl-Down</td>
        <td>Go to the desktop below</td>
    </tr>
    <tr>
        <th colspan="2">Moving windows between desktops</th>
    </tr>
    <tr>
        <td>Super-Shift-[1..4]</td>
        <td>Move current window to desktop 1, 2, 3 or 4</td>
    </tr>
    <tr>
        <td>Super-Shift-Left</td>
        <td>Move current window to the desktop to the left</td>
    </tr>
    <tr>
        <td>Super-Shift-Right</td>
        <td>Move current window to the desktop to the right</td>
    </tr>
    <tr>
        <td>Super-Shift-Up</td>
        <td>Move current window to the desktop above</td>
    </tr>
    <tr>
        <td>Super-Shift-Down</td>
        <td>Move current window to the desktop below</td>
    </tr>
    <tr>
        <th colspan="2">Window handling</th>
    </tr>
    <tr>
        <td>Alt-F4, Super-Q</td>
        <td>Close current window</td>
    </tr>
    <tr>
        <td>Alt-Esc</td>
        <td>Drown the window into the bottom of the stack</td>
    </tr>
    <tr>
        <td>Alt-Space</td>
        <td>Show window&#39;s context menu</td>
    </tr>
    <tr>
        <td>Super-F</td>
        <td>Toggle fullscreen</td>
    </tr>
    <tr>
        <td>Super-I</td>
        <td>Iconify current window</td>
    </tr>
    <tr>
        <td>Super-M</td>
        <td>Toggle maximize</td>
    </tr>
    <tr>
        <td>Super-O</td>
        <td>Toggle omnipresent</td>
    </tr>
    <tr>
        <td>Alt-Tab</td>
        <td>Switch to the next window</td>
    </tr>
    <tr>
        <td>Ctrl-Alt-Tab</td>
        <td>Switch to the previous window</td>
    </tr>
    <tr>
        <th colspan="2">(Semi)-Tiling</th>
    </tr>
    <tr>
        <td>Super-Left</td>
        <td>Shift current window to the left half of the screen</td>
    </tr>
    <tr>
        <td>Super-Right</td>
        <td>Shift current window to the right half of the screen</td>
    </tr>
    <tr>
        <td>Super-Up</td>
        <td>Shift current window to the top half of the screen</td>
    </tr>
    <tr>
        <td>Super-Down</td>
        <td>Shift current window to the bottom half of the screen</td>
    </tr>
    <tr>
        <td>Super-Home</td>
        <td>Shift current window to the upper-left corner of the screen</td>
    </tr>
    <tr>
        <td>Super-PageUp</td>
        <td>Shift current window to the upper-right corner of the screen</td>
    </tr>
    <tr>
        <td>Super-PageDown</td>
        <td>Shift current window to the bottom-right corner of the screen</td>
    </tr>
    <tr>
        <td>Super-End</td>
        <td>Shift current window to the bottom-left corner of the screen</td>
    </tr>
</table>
</details>

### Dunst mouse bindings
* Left click: Open context menu for actions and URLs.
* Right click: Close current notification.
* Middle click: Close all notifications.

## Features

### Supported distributions
These dotfiles are tested in Gentoo, Debian/Devuan and Void. Theoretically, this config should also work in other Debian-based distros (systemd-free included), and in Ubuntu and Ubuntu-based distributions as well, but not all features may be supported.

### Automatic installations of packages
In Debian-based distros, this config will automatically install needed packages using `aptitude`. The list of the packages to install is stored in the `.chezmoidata/packages-deb.yml` file.

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
* Among all icon themes, only Papirus set is fully supported by this config, due to the templating limitations (absolute paths to certain icons are specified in some dotfiles for Openbox and dunst). Using other icon themes may break some Openbox menu and dunst icons.
* Debian no longer supports `clipit` for whatever reason. As of now, I solve this issue by manually installing this package from Debian 10 and holding it (`aptitude hold` command). There is no automatic installation and support for this package so far.
