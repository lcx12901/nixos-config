{
  services.btrfs = {
    autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };
  };

  boot.initrd.postDeviceCommands = ''
    mkdir /mnt
    mount -t btrfs /dev/nvme0n1p2 /mnt
    btrfs subvolume delete /mnt/root
    btrfs subvolume snapshot /mnt/root-blank /mnt/root
  '';
}