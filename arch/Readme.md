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

#### Terminal emulator
urxvt (recommended) or xterm
