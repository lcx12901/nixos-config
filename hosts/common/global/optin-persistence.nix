{ lib, impermanence, config, ... }: {
  imports = [
    impermanence.nixosModules.impermanence
  ];

  environment.persistence = {
    "/persistent" = {
      hideMounts = true;
      # The path to be saved is first moved to the `/persistent` directory
      directories = [
        "/etc/ssh"
        "/etc/xray"
        "/var/log"
        "/var/lib"
      ];

      users.wktl = {
        directories = [
          # ".local/share"
          # ".local/state"
          "nixos-config"
          "nix-secrets"
          ".containers"
          
          {
            directory = ".ssh";
            mode = "0700";
          }
        ];
        files = [
          ".config/gh/hosts.yml"
        ];
      };
    };
  };
}