# The Dotfiles

These are my personal dotfiles which I desided to publish. This project is in permanent WIP state, so I don't guarantee that anything would work at all at any given time.

Supported distros: Debian/Devuan, Void, Gentoo (may be outdated though).

Since August 2026, I migrated to Wayland/SwayWM, thus the configuration was changed and adjusted accordingly.

## Installation

Back up your user and (which is preferable as well) system configuration.

Install [chezmoi](https://www.chezmoi.io/install/).

Clone the contents of this repository in `~/.Dots/chezmoi` (NB: specifying this directory is a must):

```
chezmoi init vbrand1984 --source ~/.Dots/chezmoi
```

Apply the configuration:

```
chezmoi apply
```

Reboot or relogin in order for changes to shell configuration to come into effect. After that, you can execute the `run-local-ansible-playbook.sh` command in order to automatically install all needed packages to the system via Ansible.

## Author

Victor Brand [vbrand1984](https://github.com/vbrand1984)

## License
This project is free software and is published under the terms of the [GPL-2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) license.

The project is provided AS IS and WITHOUT ANY WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
