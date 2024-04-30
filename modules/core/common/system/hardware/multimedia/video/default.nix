{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf isx86Linux;

  sys = config.modules.system;
in {
  config = mkIf sys.video.enable {
    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = isx86Linux pkgs;
      };
    };

    environment.systemPackages = with pkgs; [
      glxinfo
      glmark2
    ];
  };
}
