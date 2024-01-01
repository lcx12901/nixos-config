{ lib, specialArgs, config, ... }: {
  imports = [
    specialArgs.impermanence.nixosModules.impermanence
  ];

  environment.persistence = {
    "/persistent" = {
      hideMounts = true;
      directories = [
        "/etc/ssh"
        "/var/log"
        "/var/lib"
      ];

      users.wktl = {
        directories = [
          # ".local/share"
          # ".local/state"
          "nixos-config"
          
          {
            directory = ".ssh";
            mode = "0700";
          }
        ];
      };
    };
  };
}