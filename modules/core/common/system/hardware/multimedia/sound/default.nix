{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkDefault;
  cfg = config.modules.system.sound;
  dev = config.modules.device;
in {
  imports = [];
  config = mkIf (cfg.enabled && dev.hasSound) {
    sound = {
      enabled = mkDefault false;
      mediaKeys.enable = true;
    };
  };
}
