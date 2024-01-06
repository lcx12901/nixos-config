{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/daed.nix
    ../common/optional/systemd-boot.nix

    ./acme.nix
  ];

  networking.hostName = "Nezuko";

  networking.nameservers = [ "192.168.31.1" "8.8.8.8" ];

  system.stateVersion = "23.11";
}