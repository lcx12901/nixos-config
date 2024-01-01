{ lib, specialArgs, config, ... }: {
  imports = [
    specialArgs.impermanence.nixosModules.impermanence
  ];

  environment.persistence = {
    "/persist" = {
      hideMounts = true;
      directories = [
        "/var/lib/systemd"
        "/var/lib/nixos"
        "/srv"
      ];

      users.wktl = {
        directories = [
          "nixos-config"
        
          ".local/share"
          ".local/state"
        ];
      };
    };
  };
}