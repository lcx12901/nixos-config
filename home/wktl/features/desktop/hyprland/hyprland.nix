{ pkgs, ...}: {

  home.packages = with pkgs; [
    swww
    wofi
    wayland
    direnv
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  wayland.windowManager.hyprland = {
    enable = true;
    #xwayland = {
    #  enable = true;
    #};
    enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
