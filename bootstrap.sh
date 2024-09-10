#!/bin/env bash 
# bootstrap system from nothing, meant to be run (via curl and pipe into sh) from a brand new arch live boot tty.

# OPTIONS - quickly change defaults for usernames, filesystem formats, clone dir, etc.
# all overridable via environment variables.

bootsh_USERNAME=${bootsh_USERNAME:-aura}
# HOME=/mnt/home/$bootsh_USERNAME # set HOME to new value so subsequent variables can use it

bootsh_FILESYSTEM=${bootsh_FILESYSTEM:-btrfs}
bootsh_CLONE_DIR=${bootsh_CLONE_DIR:-~/.dotfiles}
bootsh_CLONE_URL=${bootsh_CLONE_URL:-https://github.com/auralluring/dotfiles}

# FUNCTIONS - mostly for device formatting, etc.
function format-btrfs() {
   SUBVOL_MOUNTOPTS=${SUBVOL_MOUNTOPTS:-relatime,space_cache=v2,compress=zstd} # set default
   mkfs.btrfs -L ROOT $device -f
   mount $device /mnt

   function subvol-create() {
       btrfs subvolume create /mnt/$1
   }
   subvol-create @ # root
   subvol-create @tmp
   subvol-create @log
   subvol-create @pkg
   subvol-create @snapshots

   umount /mnt

   function subvol-mount() {
       mkdir -p /mnt$2
       case $1 in
	   [\d]+)
	       mount -o subvolid=$1,$SUBVOL_MOUNTOPTS $device /mnt$2 ;; 
	   *)
	       mount -o subvol=$1,$SUBVOL_MOUNTOPTS $device /mnt$2 ;; 
       esac
   }
   subvol-mount @ /
   subvol-mount @tmp /tmp
   subvol-mount @log /var/log
   subvol-mount @pkg /var/cache/pacman/pkg
   # subvol-mount 5 /btrfs
}

function format-ext4() {
   mkfs.ext4 -L ROOT $device
} 

function format-device() {
   local device=${1:?Device not specified for formatting. Please give a root device like /dev/sda, or a partition of that device such as /dev/sda1.}

}

# SCRIPT - meat and potatoes - the actual flow of the script happens here.
echo Welcome to the bootstrap for aura\'s dotfiles! The goal is to have a fully setup and functioning Arch system by the end.
echo DISCLAIMER: This is a pretty heavily opinionated and customized script for installing *my own system*.
echo It is not meant to be used by others verbatim or without changes - you are more than welcome to copy things or fork my repository,
echo but if you\'re cloning directly from my dotfiles, you\'re doing it wrong. Anyway, let\'s get going.
echo 

echo Please enter the path to the drive you would like to install the system on, it should begin with \'/dev/...\' 
echo If you have already partitioned, formatted and mounted/activated all of the drives you would like to use, \
    as well as generated /etc/fstab, then simply press return without entering any characters, \
    and this process will be skipped. 
echo If you would like to do manual configuation but have not done so, \
    please do in another TTY before continuing.
read ROOT_DEVICE

if [[ ! -z $ROOT_DEVICE ]]; then
   #TODO formatting devices
   echo Sorry, this part isn\'t done yet. Please do manual configurations in another TTY and continue when you\'re done.
   read
fi

echo What would you like your machine\'s hostname to be?
readline HOSTNAME
echo $HOSTNAME > /mnt/etc/hostname
echo Hostname set to $HOSTNAME.

# create user
echo Creating user $bootsh_USERNAME...
useradd -mR /mnt $bootsh_USERNAME

# install git into the live iso (also updates pacman's database, so win win)
pacman -Sy git

# use git to clone the repo, then cd in there
mkdir -p $bootsh_CLONE_DIR
echo Cloning to $bootsh_CLONE_DIR...
git clone $bootsh_CLONE_URL $bootsh_CLONE_DIR
cd $bootsh_CLONE_DIR

# this is where the real work happens - thanks auto!
PACMAN_INSTALL_CMD='pacstrap /mnt -K'
AUR_INSTALL_CMD='aur-install'
FSROOT=/mnt
./auto.sh

echo Okay, your new system should be all set up now! Feel free to run \'arch-chroot /mnt\' to make a few tweaks first, or just \'reboot\'.
echo See you on the other side!
