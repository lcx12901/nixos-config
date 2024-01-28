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
          ".vscode-server"
          ".config/chromium"
          
          {
            directory = ".ssh";
            mode = "0700";
          }
        ];
        files = [
          ".config/gh/hosts.yml"
          ".local/share/fish/fish_history"
        ];
      };
    };
  };
}
