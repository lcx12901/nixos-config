{pkgs, ...}: {
  imports = [
    ./settings.nix
    ./style.nix
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
    });
  };

  home.packages = [
    (pkgs.writeShellScriptBin "waySong" (builtins.readFile ./scripts/waySong))
  ];
}
