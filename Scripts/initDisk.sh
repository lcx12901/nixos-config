#!/bin/bash

echoType='echo -e'

echoContent() {
    case $1 in
    # 红色
    "red")
        # shellcheck disable=SC2154
        ${echoType} "\033[31m${printN}$2 \033[0m"
        ;;
        # 天蓝色
    "skyBlue")
        ${echoType} "\033[1;36m${printN}$2 \033[0m"
        ;;
        # 绿色
    "green")
        ${echoType} "\033[32m${printN}$2 \033[0m"
        ;;
        # 白色
    "white")
        ${echoType} "\033[37m${printN}$2 \033[0m"
        ;;
    "magenta")
        ${echoType} "\033[31m${printN}$2 \033[0m"
        ;;
        # 黄色
    "yellow")
        ${echoType} "\033[33m${printN}$2 \033[0m"
        ;;
    esac
}

echo
echoContent yellow "请输入要分区的硬盘 例: /dev/sda --->"
read -r -p "要进行分区的硬盘路径:" path

echo
echoContent yellow "请输入swap分区的大小 例: 16G --->"
read -r -p "swap分区的大小为:" swapSize

primaryPart=''
secondPart=''

if [[ $path == *nvme* ]]
then
    primaryPart="${path}p2"
    secondPart="${path}p1"
else
    primaryPart="${path}2"
    secondPart="${path}1"
fi


echo $primaryPart

sleep 2

# Create a GPT partition table
parted $path -- mklabel gpt

# NixOS by default uses the ESP (EFI system partition) as its /boot partition
# Create a 512MB EFI system partition
parted $path -- mkpart ESP fat32 2MB 629MB

# set the boot flag on the ESP partition
# Format:
#    set partition flag state
parted $path -- set 1 esp on

# Create the root partition using the rest of the disk
# Format: 
#   mkpart [part-type name fs-type] start end
parted $path -- mkpart primary 630MB 100%

#lsblk

# NOTE: `cat shoukei.md | grep create-btrfs > btrfs.sh` to generate this script
mkfs.fat -F 32 -n ESP $secondPart

# create-btrfs
mkfs.btrfs $primaryPart

# mount the root partition and create subvolumes
mount $primaryPart /mnt
btrfs subvolume create /mnt/@nix
btrfs subvolume create /mnt/@tmp
btrfs subvolume create /mnt/@swap
btrfs subvolume create /mnt/@snapshots
btrfs subvolume create /mnt/@persistent
umount /mnt

sleep 2

mkdir /mnt/{nix,tmp,swap,persistent,snapshots,boot}
mount -o compress-force=zstd:1,noatime,subvol=@nix $primaryPart /mnt/nix
mount -o compress-force=zstd:1,subvol=@tmp $primaryPart /mnt/tmp
mount -o subvol=@swap $primaryPart /mnt/swap
mount -o compress-force=zstd:1,noatime,subvol=@persistent $primaryPart /mnt/persistent
mount -o compress-force=zstd:1,noatime,subvol=@snapshots $primaryPart /mnt/snapshots
mount $secondPart /mnt/boot

btrfs filesystem mkswapfile --size $swapSize --uuid clear /mnt/swap/swapfile

swapon /mnt/swap/swapfile

# show disk status
lsblk

# show swap status
swapon -s

sleep 2

nixos-generate-config --root /mnt





