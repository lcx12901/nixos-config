{
  specialArgs,
  pkgs,
  username,
  ...
}: let
  cornersSddmTheme = pkgs.callPackage ../../../../packages/cornersSddmTheme {};
in {
  # XDG portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # need qt5 for sddm theme
  environment.systemPackages = with pkgs; [
    cornersSddmTheme
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtquickcontrols2
    networkmanagerapplet
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    displayManager = {
      sddm = {
        enable = true;
        theme = "corners";
      };
    };
  };

  programs.hyprland = {
    enable = true;
    package = specialArgs.hyprland.packages.${pkgs.system}.hyprland;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [];
  };
  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "performance";
}
