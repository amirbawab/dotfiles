## Install Arch linux

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

### Set Wifi
