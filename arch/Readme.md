### Arch config:
#### Display / Login manager
LXDM
```
pacman -S lxdm
systemctl enable lxdm
```

#### Desktop Environment
None

#### Window Manager
i3
```
pacman -S i3
```
* I3 config files can be found under https://github.com/amirbawab/dotfiles/tree/master/.config
* Install font-awesome byt downloading the latest tar (e.g. https://github.com/FortAwesome/Font-Awesome/releases) and moving the font/fontawesome-webfont.ttf file ttf to ~./fonts (create dir if not there)

#### Terminal emulator
urxvt (recommended) or xterm
