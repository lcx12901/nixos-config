{ hyprland, ... }: {
  imports = [
    hyprland.homeManagerModules.default
    ./hyprland.nix
    ./config.nix
    ./variables.nix

    ../waybar
    ../wofi
    ../gtk
    ../wallpapers
    ../fcitx5
    ../chromium
  ];
}