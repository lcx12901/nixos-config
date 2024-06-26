{
  username,
  pkgs,
  nix-index-database,
  ...
}: {
  imports = [
    nix-index-database.hmModules.nix-index
    ./global
    ./features/desktop/hyprland
    ./features/desktop/game
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    stateVersion = "23.11";
  };

  home.packages = with pkgs; [
    neofetch
    parsec-bin
    vlc
    telegram-desktop
    gnome.nautilus # Gnome File Manager

    playerctl # controller for media players
    pavucontrol # pulseaudio volume controle (GUI)
    pamixer # pulseaudio command line mixer
    unzip

    feishu
    remmina
  ];

  programs = {
    home-manager.enable = true;
    nix-index.enable = true;
    nix-index.enableZshIntegration = true;
    nix-index-database.comma.enable = true;
  };
}
