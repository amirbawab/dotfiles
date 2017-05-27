## Install Arch linux

*This instruction sheet is based on `LearnLinux.tv` youtube channel.*  
*Youtube videos*:
* <a href="https://www.youtube.com/watch?v=lizdpoZj_vU">Video 1</a>
* <a href="https://www.youtube.com/watch?v=GCUmGtCYPWM">Video 2</a>

### Download Arch image
Latest image: https://www.archlinux.org/download/

### Burn image to USB
Locate the iso image and the /dev/sdx partition (e.g. /dev/sdb), then run:
```
dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress && sync
```

### Create partitions
* Plug usb and boot into Arch linux live media
* Type `fdisk -l` to see the list of hard drives. At the end of this instruction sheet, Arch will be the only OS installed.
* Blank out hard drive and start partitioning. In this instruction sheet, 3 partitions will be created (One for the OS `/`, one for the users `/home`, and one for the memory swap):
```
$ fdisk /dev/sda
> press `o` to blank out the hard drive

# Create OS partition
> press `n` to create the OS partition
> > press enter to choose default primary
> > press enter to choose default partition number
> > press enter to set default first sector
> > type `+30G` to set the memory allocated for this partition, after this the partition is created
> press `a` to make the only partition created as bootable

# Create Swap partition, in case memory (ram) is full
> press `n` to create the Swap parition
> > press enter to choose default primary
> > press enter to choose default partition number
> > press enter to set default first sector
> > type `+4G` to set the memory allocated for this parition, after this the partition is created

# Set the type of the Swap parition
> type `type` to change the Swap partition type
> > press enter to choose default last parition created
> > type `82` to change the type of the Swap parition to `Linux swap / Solaris`

# Create User partition
> press `n` to create the User partition
> > press enter to choose default primary
> > press enter to choose default partition number
> > press enter to set default first sector
> > press enter to set default last sector, all remaining memory is assigned to this partition, after this the partition is created

# Write changes
> press `w` to write changes
```
* To see the created partitions type `fdisk -l`
* Format partitions:
```
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda3
```

### Install Arch packages into created partitions
* Internet connection through Wifi can be established using `netctl`:
```
# Copy a configuration example
cp /etc/netctl/examples/wireless-wpa /etc/netctl/home-wifi

# Configure file by editing /etc/netctl/home-wifi and change interface, essid and key values

# Connect
cd /etc/netctl/ && netctl start home-wifi
```
* Mount paritions
```
mkdir /mnt/home
mount /dev/sda1 /mnt
mount /dev/sda3 /mnt/home
```
* Install Arch base packages and configure system
```
# Install packages into OS partition, if an error occured during this installation, then edit /etc/pacman.d/mirrorlist and swap the first sever with another one in the list
pacstrap -i /mnt base
> press enter to install default all

# Generate fstab
genfstab -U -p /mnt >> /mnt/etc/fstab

# Chroot into OS partition mounted at /mnt
arch-chroot /mnt

# Install packages
pacman -S vim openssh grub-bios linux-headers linux-lts linux-lts-headers wpa_supplicant wireless_tools wpa_actiond dialog

# Edit /etc/locale.gen by uncommenting `en_US.UTF-8 UTF-8`

# Generate locale
locale-gen

# Configure timezone 
ln -sf /usr/share/zoneinfo/America/Montreal /etc/localtime

# Configure clock
hwclock --systohc --utc

# Enable ssh service at boot time
systemctl enable sshd.service

# Create root password
passwd

# Install grub bootloader
grub-install --target=i386-pc --recheck /dev/sda

# Copy grub.mo
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

# Create grub configuration 
grub-mkconfig -o /boot/grub/grub.cfg

# Exit arch-chroot session
exit

# Unmount partitions
umount /mnt/home
umount /mnt

# Reboot
reboot

# Set locale system wide
localectl set-locale LANG="en_US.UTF-8"

# Activate swap
mkswap /dev/sda2

# Modify fstab
echo -e "$(blkid | grep sda2 | awk '{print $2}' | sed -e 's/"//g')\tnone\tswap\tdefaults\t0 0" >> /etc/fstab

# If SSD is used, then add in `/etc/fstab` the `discard` option in dir `/` and `/home` (e.g. rw,discard,realtime,...)

# Reboot
reboot
```
* Set up Wifi
```
# Copy a configuration example
cp /etc/netctl/examples/wireless-wpa /etc/netctl/home-wifi

# Configure file by editing /etc/netctl/home-wifi and change interface, essid and key values

# Connect
cd /etc/netctl/ && netctl start home-wifi
```
* Install touchpad driver
```
pacman -S xf86-input-libinput
```
* Install Xorg display server
```
pacman -S xorg-server xorg-xinit xorg-server-utils mesa
```
* Allow 32-bitpackages by editing `/etc/pacman.conf` and uncommenting `[multilib]` block
* [If not virtual machine] Install intel video card driver. Run `lspci` to know if which graphic card exists
```
pacman -S xf86-video-intel lib32-intel-dri lib32-mesa lib32-libgl
```
* [If virtual machine] Install the following driver:
```
pacman -S virtualbox-guest-utils
```
* Create a user
```
# Install sudo
pacman -S sudo

# Uncomment %wheel ALL=(ALL) ALL
visudo

# Create user
useradd -m -G wheel -s /bin/bash foo

# Change password
passwd foo
```
* Rename machine
```
# Set hostname
hostnamectl set-hostname foo

# Reboot machine
reboot
```
