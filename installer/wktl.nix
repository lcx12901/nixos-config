{
  imports = [
    ../home/wktl/features/cli/ssh
  ];

  home = {
    username = "wktl";
    homeDirectory = "/home/wktl";

    stateVersion = "23.11";
  };

  security.sudo.wheelNeedsPassword = false;

  users.mutableUsers = false;

  users.users.wktl = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
    ];
    hashedPassword = "$6$XXUp9uRF41kC5YHm$lsOLgDuECYb9CbDHBRpsPashoBzB794KoLWI2NCpOl5cB9puDosikhJwGXNxuLf/mW6nJ0SdYkasIAIHfd99/0";
  };

  programs = {
    home-manager.enable = true;
  };
}
