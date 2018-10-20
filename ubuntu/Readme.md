## Ubuntu Linux


### Desktop Environment
Default: Unity/Gnome

### Window Manager
#### i3
```
sudo apt-get install i3
```
* I3 config: https://github.com/amirbawab/dotfiles/tree/master/.config
* I3 blur lock: https://github.com/amirbawab/dotfiles/blob/master/scripts/i3blurlock

### Fonts
#### Font Awesome
Install font-awesome by downloading the latest tar (e.g. https://github.com/FortAwesome/Font-Awesome/releases) and moving the font/fontawesome-webfont.ttf file ttf to ~./fonts (create dir if not there)

### Composite manager
Compton
```
sudo apt-get install compton
```
* Compton.json: https://github.com/amirbawab/dotfiles/blob/master/.config/compton.conf

### Terminal emulator
#### gnome-terminal
Xresources: https://github.com/amirbawab/dotfiles/blob/master/.Xresources
```
# Reload Xresources
xrdb -merge ~/.Xresources
```

### Network manager
#### Using gnome-control-center
```
env XDG_CURRENT_DESKTOP=GNOME gnome-control-center
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
