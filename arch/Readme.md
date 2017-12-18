## Arch Linux
### Installing Arch
Instructions: https://github.com/amirbawab/dotfiles/blob/master/arch/Install-arch.md

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
* Compton.json: https://github.com/amirbawab/dotfiles/blob/master/.config/compton.conf

### Terminal emulator
#### urxvt
Xresources: https://github.com/amirbawab/dotfiles/blob/master/.Xresources
```
# Reload Xresources
xrdb -merge ~/.Xresources
```

### Network manager
#### wicd
```
pacman -S wicd
```
* https://wiki.archlinux.org/index.php/wicd

#### connman
```
pacman -S wpa_supplicant connman
```
* https://wiki.archlinux.org/index.php/Connman#Troubleshooting

##### VPN
**Install PPTP Client**
```
pacman -S pptp
```
* https://wiki.archlinux.org/index.php/PPTP_Client

**Register a VPN server**
```
pptpsetup --create my_tunnel --server vpn.example.com --username alice --password foo --encrypt
```

**Remove a VPN server**
```
pptpsetup --delete my_tunnel
```

**Connect to VPN server**
```
pon my_tunnel
```

**Disconnect from a VPN server**
```
poff my_tunnel
```

**Route all traffic**  
Traffic routing must be done after connecting to the VPN server
```
# Check the ip route table before any modification
# Keep track of the "default" row as this is needed
# to revert changes/restore default configurations
ip route
(example "default" row output: default via 1.2.3.4 dev wlp4s0)

# Route default to ppp0
ip route replace default dev ppp0

# Route restore previous routing configuration
ip route replace default via 1.2.3.4 dev wlp4s0
```

### Editor
#### Vim
* vimrc++: https://github.com/amirbawab/dotfiles/blob/master/.vimrc%2B%2B
* vimrc_powerline: https://github.com/amirbawab/dotfiles/blob/master/.vimrc_powerline
* vimrc_vundle: https://github.com/amirbawab/dotfiles/blob/master/.vimrc_vundle
```
# Source .vimrc++ from .vimrc
echo "source ~/.vimrc++" >> ~/.vimrc
```

##### Vundle (optional)
```
# Source: https://github.com/VundleVim/Vundle.vim#quick-start
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
vim +PluginInstall +qall
```

### Shell
#### Bash
* bashrc++: https://github.com/amirbawab/dotfiles/blob/master/.bashrc%2B%2B
* bashrc_powerline: https://github.com/amirbawab/dotfiles/blob/master/.bashrc_powerline
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
