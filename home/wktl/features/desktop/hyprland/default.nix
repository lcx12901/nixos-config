{ hyprland, ... }: {
  imports = [
    hyprland.homeManagerModules.default
    ./hyprland.nix
    ./config.nix
    ./variables.nix
  ];
}