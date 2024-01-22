{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/container.nix
    ../common/optional/nextcloud.nix
    ../common/optional/postgresql.nix
    ../common/optional/proxy.nix
    ../common/optional/systemd-boot.nix

    ../common/desktop/hyprland

    ./website
  ];

  networking.hostName = "Nezuko";

  networking.nameservers = [ "119.29.29.29" ];

  networking.proxy.default = "http://127.0.0.1:10809";

  environment.systemPackages = with pkgs; [
    ffmpeg
  ];

  system.stateVersion = "23.11";
}
