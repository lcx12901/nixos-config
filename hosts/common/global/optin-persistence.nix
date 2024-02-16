{
  lib,
  impermanence,
  config,
  ...
}: {
  imports = [
    impermanence.nixosModules.impermanence
  ];

  environment.persistence = {
    "/persistent" = {
      hideMounts = true;
      # The path to be saved is first moved to the `/persistent` directory
      directories = [
        "/etc/ssh"
        "/etc/mihomo/rule_provider"
        "/var/log"
        "/var/lib"
      ];

      users.wktl = {
        directories = [
          # ".local/state"

          ".containers"

          ".vscode-server"

          ".config/netease-cloud-music-gtk4"
          ".config/chromium"
          ".config/VSCodium/User"
          ".config/discord"

          ".local/share/TelegramDesktop"

          "Coding"
          "Music"

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
