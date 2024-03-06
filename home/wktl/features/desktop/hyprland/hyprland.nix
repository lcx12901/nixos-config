{
  pkgs,
  hypr-contrib,
  ...
}: {
  home.packages = with pkgs; [
    swww
    wofi
    wayland

    hypr-contrib.packages.${pkgs.system}.grimblast
    neovide
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];

  wayland.windowManager.hyprland = {
    enable = true;
    #xwayland = {
    #  enable = true;
    #};
    enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
