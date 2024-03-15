{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/proxy.nix
    ../common/optional/systemd-boot.nix

    ../common/desktop/virtualisation
    ../common/desktop/hyprland
  ];

  networking.hostName = "Icarus";

  networking.nameservers = ["1.1.1.1 8.8.8.8"];

  security.polkit.enable = true;

  networking.firewall.allowedTCPPortRanges = [
    {
      from = 8033;
      to = 8039;
    }
  ];

  networking.extraHosts = ''
    127.0.0.1 t3.dahui99.com
  '';

  system.stateVersion = "23.11";
}
