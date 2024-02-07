{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/proxy.nix
    ../common/optional/systemd-boot.nix

    ../common/desktop/hyprland
  ];

  networking.hostName = "Emilia";

  networking.nameservers = ["1.1.1.1 8.8.8.8"];

  security.polkit.enable = true;

  system.stateVersion = "23.11";
}
