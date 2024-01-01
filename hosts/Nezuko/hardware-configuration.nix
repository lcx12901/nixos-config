# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

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

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/90d9f32c-99bb-4b7b-b46e-54a9cc6b4525";
      fsType = "btrfs";
      options = [ "subvol=@nix" "noatime" "compress-force=zstd:1" ];
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/90d9f32c-99bb-4b7b-b46e-54a9cc6b4525";
      fsType = "btrfs";
      options = [ "subvol=@tmp" ];
    };

  fileSystems."/persistent" =
    { device = "/dev/disk/by-uuid/90d9f32c-99bb-4b7b-b46e-54a9cc6b4525";
      fsType = "btrfs";
      options = [ "subvol=@persistent" "compress-force=zstd:1" ];
      # impermanence's data is required for booting.
      neededForBoot = true;
    };

  fileSystems."/snapshots" =
    { device = "/dev/disk/by-uuid/90d9f32c-99bb-4b7b-b46e-54a9cc6b4525";
      fsType = "btrfs";
      options = [ "subvol=@snapshots" "compress-force=zstd:1" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/90d9f32c-99bb-4b7b-b46e-54a9cc6b4525";
      fsType = "btrfs";
      options = [ "subvol=@swap" "ro" ];
    };
  
  # remount swapfile in read-write mode
  fileSystems."/swap/swapfile" = {
    # the swapfile is located in /swap subvolume, so we need to mount /swap first.
    depends = ["/swap"];

    device = "/swap/swapfile";
    fsType = "none";
    options = ["bind" "rw"];
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/9FD5-2466";
      fsType = "vfat";
    };

  swapDevices = [ 
    { device = "/swap/swapfile"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}