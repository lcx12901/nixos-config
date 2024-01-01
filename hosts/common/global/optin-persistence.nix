{ lib, specialArgs, config, ... }: {
  imports = [
    specialArgs.impermanence.nixosModules.impermanence
  ];

  environment.persistence = {
    "/persist" = {
      hideMounts = true;
      # directories = [
      #   "/var/log"
      #   "/var/lib"
      # ];

      users.wktl = {
        directories = [
          # ".local/share"
          # ".local/state"
        ];
      };
    };
  };
}