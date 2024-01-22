{ specialArgs, pkgs, ... }: {
  # XDG portal
  xdg.portal = { 
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
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