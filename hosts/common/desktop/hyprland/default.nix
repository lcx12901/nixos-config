{
  specialArgs,
  pkgs,
  ...
}: let
  myNur = pkgs.nur.repos.lcx12901;
in {
  # XDG portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  # need qt5 for sddm theme
  # environment.systemPackages = with pkgs;
  #   [
  #     libsForQt5.qt5.qtgraphicaleffects
  #     libsForQt5.qt5.qtsvg
  #     libsForQt5.qt5.qtquickcontrols2
  #     networkmanagerapplet
  #   ]
  #   ++ (with myNur; [
  #     cornersSddmTheme
  #   ]);

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
        autoSuspend = false;
      };
    };
  };

  # services.displayManager = {
  #   enable = true;
  #   sddm = {
  #     enable = true;
  # theme = "corners";
  #   };
  # };

  programs.hyprland = {
    enable = true;
    package = specialArgs.hyprland.packages.${pkgs.system}.hyprland;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "performance";
}
