## NixOS_Installation_Guide

### Btrfs

#### Partition the disk

```shell
printf "label: gpt\n,550M,U\n,,L\n" | sfdisk /dev/sdX
```

#### Format partitions and create subvolumes

```shell
nix-shell -p btrfs-progs
mkfs.fat -F 32 /dev/sdX1

mkfs.btrfs /dev/sdX2
mkdir -p /mnt
mount /dev/sdX2 /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
umount /mnt
```

#### Mount the partitions and subvolumes

```shell
mkfs.btrfs /dev/mapper/enc # Creating btrfs partition

mount -t btrfs /dev/mapper/enc /mnt

# Create the subvolumes 

btrfs subvolume create /mnt/root # The subvolume for /, which will be cleared on every boot

btrfs subvolume create /mnt/home # The subvolume for /home, which should be backed up

btrfs subvolume create /mnt/nix # The subvolume for /nix, which needs to be persistent but is not worth backing up, as it’s trivial to reconstruct

btrfs subvolume create /mnt/persist # The subvolume for /persist, containing system state which should be persistent across reboots and possibly backed up

btrfs subvolume create /mnt/log # The subvolume for /var/log.

# Take an empty *readonly* snapshot of the root subvolume, which can be rollback to on every boot.
btrfs subvolume snapshot -r /mnt/root /mnt/root-blank
```

Add the following nix config to clear the root volume on every boot

```shell
{
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /mnt
    mount -t btrfs /dev/mapper/enc /mnt
    btrfs subvolume delete /mnt/root
    btrfs subvolume snapshot /mnt/root-blank /mnt/root
    umount /mnt
  '';
}
```

Unmount to mount on the subvolumes for the next steps:

```shell
umount /mnt
```

Once the subvolumes has been created, mount them with the options. Example with [Zstandard compression](https://facebook.github.io/zstd/) with noatime:

```shell
mount -o subvol=root,compress=zstd,noatime /dev/mapper/enc /mnt 

mkdir /mnt/home

mount -o subvol=home,compress=zstd,noatime /dev/mapper/enc /mnt/home

mkdir /mnt/nix

mount -o subvol=nix,compress=zstd,noatime /dev/mapper/enc /mnt/nix

mkdir /mnt/persist

mount -o subvol=persist,compress=zstd,noatime /dev/mapper/enc /mnt/persist

# do not forget to create and mount the bootloader

mkdir /mnt/boot

mount "$DISK"p1 /mnt/boot
```
#### Generate Nixconfig

```shell
nixos-generate-config --root /mnt
```

#### Install NixOS

```shell
nixos-install --no-root-password
```