{ username, pkgs, ...}:
{
  imports = [
    ../common/global
    ../common/wsl.nix
  ];

  # time.timeZone = "Asia/Shanghai";

  networking.hostName = "Mikasa";

  systemd.tmpfiles.rules = [
    "d /home/${username}/.config 0755 ${username} users"
  ];

  environment.systemPackages = with pkgs; [
    wget
  ];

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;

  users.mutableUsers = false;

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
    ];
    hashedPassword = "$6$XXUp9uRF41kC5YHm$lsOLgDuECYb9CbDHBRpsPashoBzB794KoLWI2NCpOl5cB9puDosikhJwGXNxuLf/mW6nJ0SdYkasIAIHfd99/0";
  };

  system.stateVersion = "23.05";
}
