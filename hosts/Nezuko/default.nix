{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/wktl
    ../common/optional/brtfs.nix
    ../common/optional/systemd-boot.nix
  ];

  networking.hostName = "Nezuko";

  system.stateVersion = "23.11";
}