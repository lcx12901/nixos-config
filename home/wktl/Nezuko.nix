{ username, pkgs, nix-index-database, ... }: {
  imports = [
    nix-index-database.hmModules.nix-index
    ./global
    ./features/desktop/hyprland
    ./features/desktop/waybar
    ./features/desktop/wofi
    ./features/desktop/gtk
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    stateVersion = "23.11";
  };

  home.packages = with pkgs; [
    neofetch
  ];

  programs = {
    home-manager.enable = true;
    nix-index.enable = true;
    nix-index.enableZshIntegration = true;
    nix-index-database.comma.enable = true;
  };
}