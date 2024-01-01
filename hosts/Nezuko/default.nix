{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/ddns-go.nix
  ];

  networking.hostName = "Nezuko";

  system.stateVersion = "23.11";
}