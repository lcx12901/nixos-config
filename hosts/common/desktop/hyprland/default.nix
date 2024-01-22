{ specialArgs, pkgs, ... }: {
  # XDG portal
  xdg.portal = { 
    enable = true;
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    displayManager = {
      sddm = {
        enable = true;
      };
    };
  };

  programs.hyprland = {
    enable = true;
    package = specialArgs.hyprland.packages.${pkgs.system}.hyprland;
  };
}