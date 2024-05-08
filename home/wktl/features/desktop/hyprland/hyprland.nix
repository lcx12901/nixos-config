{
  pkgs,
  hypr-contrib,
  ...
}: {
  home.packages = with pkgs; [
    swww
    wofi
    wayland
    wl-clipboard

    hypr-contrib.packages.${pkgs.system}.grimblast
    # https://aur.archlinux.org/cgit/aur.git/plain/license.tar.gz?h=wechat-uos
    wechat-uos
    bottles
    postman
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];

  wayland.windowManager.hyprland = {
    enable = true;
    #xwayland = {
    #  enable = true;
    #};
    systemd.enable = true;
  };
}
