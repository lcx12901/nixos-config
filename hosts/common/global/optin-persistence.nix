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
        "/var/log"
        "/var/lib"
        "/run/agenix"
        "/run/agenix.d"
      ];

      users.wktl = {
        directories = [
          # ".local/share"
          # ".local/state"
          "nixos-config"
          "nix-secrets"
          
          {
            directory = ".ssh";
            mode = "0700";
          }
        ];
      };
    };
  };
}