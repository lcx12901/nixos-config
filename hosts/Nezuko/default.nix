{
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

  networking.nameservers = [ "119.29.29.29" "8.8.8.8" ];

  system.stateVersion = "23.11";
}