## Arch Linux
### Display / Login manager
#### LXDM
```
# Install LXDML
pacman -S lxdm

# Enable service at boot
systemctl enable lxdm

# Allow multi-monitors
echo "xrandr --output HDMI2 --right-of eDP1" >> /etc/lxdm/PostLogin # Run xrandr for exact values of HDMI2 and eDP1
```
##### Theme
Archlinux: https://github.com/amirbawab/dotfiles/tree/master/arch/lxdm-theme
```
# Copy theme to lxdm themes
sudo cp -avr Archlinux/ /usr/share/lxdm/themes/

# Set as default theme
vim /etc/lxdm/lxdm.conf
```

### Desktop Environment
None

### Window Manager
#### i3
```
pacman -S i3
```
* I3 config: https://github.com/amirbawab/dotfiles/tree/master/.config
* I3 blur lock: https://github.com/amirbawab/dotfiles/blob/master/scripts/i3blurlock

### Fonts
#### Font Awesome
Install font-awesome by downloading the latest tar (e.g. https://github.com/FortAwesome/Font-Awesome/releases) and moving the font/fontawesome-webfont.ttf file ttf to ~./fonts (create dir if not there)

#### DejaVu
```
pacman -S ttf-dejavu
```

### Composite manager
Compton
```
pacman -S compton
```

### Terminal emulator
#### urxvt
Xresources: https://github.com/amirbawab/dotfiles/blob/master/.Xresources
```
# Reload Xresources
xrdb -merge ~/.Xresource
```

### Network manager
#### connman
```
pacman -S wpa_supplicant connman
```
* https://wiki.archlinux.org/index.php/Connman#Troubleshooting

### Editor
#### Vim
vimrc: https://github.com/amirbawab/dotfiles/blob/master/.vimrc

### Shell
#### Bash
bashrc++: https://github.com/amirbawab/dotfiles/blob/master/.bashrc%2B%2B
```
# Source .bashrc++ from .bashrc
echo "source ~/.bashrc++" >> ~/.bashrc
```

##### Powerline (optional)
```
# Install python pip
sudo pacman -S python-pip

# Install powerline
sudo pip install powerline-status

# Install fonts
mkdir /tmp/fonts

# Clone powerline fonts
git clone https://github.com/powerline/fonts.git

# Install fonts
cd fonts && ./install.sh
```
