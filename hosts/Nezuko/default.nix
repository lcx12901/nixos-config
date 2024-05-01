{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/container.nix
    ../common/optional/mpd.nix
    ../common/optional/nextcloud.nix
    ../common/optional/postgresql.nix
    ../common/optional/mysql.nix
    ../common/optional/proxy.nix
    ../common/optional/systemd-boot.nix

    ../common/desktop/hyprland
    ../common/desktop/virtualisation
    ../common/desktop/game

    ./website
  ];

  networking.hostName = "Nezuko";

  networking.nameservers = ["1.1.1.1 8.8.8.8"];

  networking.firewall.trustedInterfaces = ["podman0"];

  environment.systemPackages = with pkgs; [
    ffmpeg
  ];

  hardware.opengl = {
    extraPackages = with pkgs; [
      amdvlk

      # mesa
      mesa

      # vulkan
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
    extraPackages32 = [pkgs.driversi686Linux.amdvlk];
  };

  security.polkit.enable = true;

  system.stateVersion = "23.11";
}
