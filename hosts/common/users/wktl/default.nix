{
  pkgs,
  config,
  username,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  security.sudo.wheelNeedsPassword = false;

  users.mutableUsers = false;

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups =
      [
        "wheel"
        "video"
        "audio"
      ]
      ++ ifTheyExist [
        "minecraft"
        "network"
        "wireshark"
        "i2c"
        "mysql"
        "docker"
        "podman"
        "git"
        "libvirtd"
        "deluge"
        "postgres"
      ];
    hashedPassword = "$6$XXUp9uRF41kC5YHm$lsOLgDuECYb9CbDHBRpsPashoBzB794KoLWI2NCpOl5cB9puDosikhJwGXNxuLf/mW6nJ0SdYkasIAIHfd99/0";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpxcfZZ8NJN8v+y1rIiiMyNw9SmTy5r/5U+nJlCsL6J5jhQH85A4UmDrpsh04Y8WWg2KJ2qX7Abb7mE6bfahSUE7pAEVYijhbBkf9giJsR+ZVW3mIEf1kgPIxRhIVVw27EDd/UsDyZKSDuXwuVWE4s2qG7d1mIZBq+dpcBHNejc9jQUGYYSW31FWiXz+hXDno92T3FWEHUgu08sBKTd5BT2fHvy9eqndGtYCIWa6bDnxYZrxJNpoJx66Z7xLTrombaeGMO+BKXMtS3XMS4chqFgGZOy0hWUBMmx1/aqf10kc0kfpVW8Z+QMd4a5aQE23KFO3w2hxSHXsQNFaRei7wR6eN/jNuLoT8Cx0kHDVMJsOSdXoIgU40Z8/0nw6mHl47Ufk5Vplmrs1KybdWeS8clnuja3aI74X14WB4KN3mMqW4sC6MOmPSd0cJHrm0yiUq8/3H8ouD/oF8w+jRHdlBHOC72MfcgYJ5tZwKYzuKPhLYxctO19Xbr/BKoRHWNWCs= wktl@wktl1991504424@gmail.com"
    ];
  };

  # Trash:// enable
  services.gvfs.enable = true;
}
