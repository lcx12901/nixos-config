{ lib, ... }: {
  services.btrfs = {
    autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };
  };

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /mnt
    mount -t btrfs /dev/sda2 /mnt
    btrfs subvolume delete /mnt/root
    btrfs subvolume snapshot /mnt/root-blank /mnt/root
    umount /mnt
  '';
}