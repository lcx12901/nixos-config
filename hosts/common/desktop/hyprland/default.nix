{
  specialArgs,
  pkgs,
  ...
}: {
  # XDG portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = false;
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
      gdm = {
        enable = true;
        wayland = true;
        autoSuspend = false;
      };
    };
  };

  programs.hyprland = {
    enable = true;
    package = specialArgs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "performance";
}
