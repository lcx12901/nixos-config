{

  imports = [
    ../common/global
    ../common/users/wktl
    ../common/optional/systemd-boot.nix
  ];

  networking.hostName = "Nezuko";

  system.stateVersion = "23.11";
}