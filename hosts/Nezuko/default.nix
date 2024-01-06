{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/dae.nix
    ../common/optional/systemd-boot.nix

    ./acme.nix
  ];

  networking.hostName = "Nezuko";

  networking.nameservers = [ "223.5.5.5" ];

  system.stateVersion = "23.11";
}