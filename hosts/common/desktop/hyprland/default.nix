{ specialArgs, pkgs, username, ... }: {
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
    xkb = {
      layout = "us";
      variant = "";
    };
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
