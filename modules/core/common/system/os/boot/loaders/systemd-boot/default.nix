{
  config,
  lib,
  ...
}: let
  inherit (lib) mkDefault mkIf optionalAttrs;

  cfg = config.modules.system;
in {
  config = mkIf (cfg.boot.loader == "systemd-boot") {
    boot.loader = {
      systemd-boot =
        {
          enable = true;
          configuration = null;
          consoleMode = mkDefault "max";

          editor = false;
        }
        // optionalAttrs cfg.boot.memtest.enable {
          # https://matrix.to/#/!sgkZKRutwatDMkYBHU:nixos.org/$iKnJUt1L_7E5bq7hStDPwv6_2HTBvNjwfcWxlKlF-k8?via=nixos.org&via=matrix.org&via=nixos.dev
          extraFiles."efi/memtest86plus/memtest.efi" = "${cfg.boot.memtest.package}/memtest.efi";
          extraEntries."memtest86plus.conf" = ''
            title MemTest86+
            efi   /efi/memtest86plus/memtest.efi
          '';
        };
    };
  };
}
