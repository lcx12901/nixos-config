{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/global/optin-persistence.nix

    ../common/users/wktl

    ../common/optional/brtfs.nix
    ../common/optional/postgresql.nix
    ../common/optional/proxy.nix
    ../common/optional/systemd-boot.nix

    ./website
  ];

  networking.hostName = "Nezuko";

  networking.nameservers = [ "119.29.29.29" ];

  networking.proxy.default = "http://127.0.0.1:10809";

  system.stateVersion = "23.11";
}