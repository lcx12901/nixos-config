{
  waybar,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./style.nix
  ];

  programs.waybar = {
    enable = true;
    package = waybar.packages.${pkgs.system}.default;
  };

  home.packages = [
    (pkgs.writeShellScriptBin "waySong" (builtins.readFile ./scripts/waySong))
  ];
}
