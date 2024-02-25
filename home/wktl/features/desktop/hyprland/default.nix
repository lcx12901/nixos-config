{hyprland, ...}: {
  imports = [
    hyprland.homeManagerModules.default
    ./hyprland.nix
    ./config.nix
    ./variables.nix

    ../xdg

    ../kitty
    ../waybar
    ../wofi
    ../cava
    ../mako
    ../gtk
    ../wallpapers

    ../fcitx5
    ../chromium
    ../vscodium
    ../discord
  ];
}
