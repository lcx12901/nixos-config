{ lib, specialArgs, config, ... }: {
  imports = [
    specialArgs.impermanence.nixosModules.impermanence
  ];

  environment.persistence = {
    "/persist" = {
      directories = [
        "/var/lib/systemd"
        "/var/lib/nixos"
        "/srv"
      ];
    };
  };
}