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
        "/etc/mihomo"
        "/var/log"
        "/var/lib"
      ];

      users.wktl = {
        directories = [
          # ".local/state"

          ".containers"

          ".vscode-server"
          ".config/mpd"
          ".config/chromium"
          ".config/VSCodium/User"
          ".config/discord"
          ".config/Vencord"
          ".config/LarkShell"
          ".config/go-musicfox"

          ".local/share/TelegramDesktop"
          ".local/share/nvim"
          ".local/share/z"

          "Coding"
          "Downloads"
          "Music"
          "Documents"

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
