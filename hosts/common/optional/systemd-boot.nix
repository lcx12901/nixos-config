{
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.loader.systemd-boot.configurationLimit = 10;

  # clear /tmp on boot to get a stateless /tmp directory.
  boot.tmp.cleanOnBoot = true;

  # supported fil systems, so we can mount any removable disks with these filesystems
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "xfs"
    "ntfs"
    "fat"
    "vfat"
    "cifs" # mount windows share
  ];

  # equal to `mount -t tmpfs tmpfs /`
  fileSystems."/" = {
    device = "tmpfs";
    fsType = "tmpfs";
    # set mode to 755, otherwise systemd will set it to 777, which cause problems.
    # relatime: Update inode access times relative to modify or change time.
    options = ["relatime" "mode=755"];
  };

  swapDevices = [
    {device = "/swap/swapfile";}
  ];
}
