#!/bin/env bash 
# bootstrap system from nothing, meant to be run (via curl and pipe into sh) from a brand new arch live boot tty.

function format-btrfs() {
   SUBVOL_MOUNTOPTS=${SUBVOL_MOUNTOPTS:-relatime,space_cache=v2,compress=zstd} # set default
   local device=${1:?Device not specified for formatting. Please give a root device like /dev/sda, or a partition of that device such as /dev/sda1.}
   if [[ -z ${device/%\d} ]]; then
       echo full device
       device=${device}1
   fi
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
   subvol-mount 5 /btrfs
}
format-btrfs /dev/sda1
btrfs sub list /mnt/
# umount /mnt
# install git into the live iso
# git clone dotfiles
#
# arch-chroot /mnt
#
# run regular dotfiles script
#
