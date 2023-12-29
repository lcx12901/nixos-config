{ username, pkgs, agenix, ...}:
{
  imports = [
    ../common/global
    ../common/wsl.nix
    ../common/users/wktl
  ];

  networking.hostName = "Mikasa";

  systemd.tmpfiles.rules = [
    "d /home/${username}/.config 0755 ${username} users"
  ];

  system.stateVersion = "23.11";
}
