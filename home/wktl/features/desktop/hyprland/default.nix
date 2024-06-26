{hyprland, ...}: {
  imports = [
    hyprland.homeManagerModules.default
    ./hyprland.nix
    ./hyprlock.nix
    ./config.nix
    ./variables.nix

    ../xdg

    ../kitty
    ../neovim
    ../helix
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
    ../firefox
  ];
}
