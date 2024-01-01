{ lib, specialArgs, config, ... }: {
  imports = [
    specialArgs.impermanence.nixosModules.impermanence
  ];

  environment.persistence = {
    "/persistent" = {
      hideMounts = true;
      # The path to be saved is first moved to the `/persistent` directory
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