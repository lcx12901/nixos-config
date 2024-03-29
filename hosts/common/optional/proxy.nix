{
  pkgs,
  clash-subscribe,
  metacubexd,
  ...
}: let
  mihomo-meta = pkgs.callPackage ../../../packages/mihomo {};
  maxmind-geoip = pkgs.callPackage ../../../packages/maxmind-geoip {};
in {
  environment.systemPackages = [
    mihomo-meta
    maxmind-geoip
  ];

  environment.etc."mihomo/config.yaml".source = "${clash-subscribe}/wktl.yaml";

  environment.etc."mihomo/ui".source = metacubexd;

  systemd.services.mihomo-meta = {
    description = "mihomo-meta Daemon";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      LimitNPROC = 500;
      LimitNOFILE = 1000000;
      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_RAW CAP_NET_BIND_SERVICE CAP_SYS_TIME CAP_SYS_PTRACE CAP_DAC_READ_SEARCH";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_RAW CAP_NET_BIND_SERVICE CAP_SYS_TIME CAP_SYS_PTRACE CAP_DAC_READ_SEARCH";
      Restart = "always";
      ExecStartPre = "/run/current-system/sw/bin/sleep 1s";
      ExecStart = "${mihomo-meta}/bin/mihomo-meta -d /etc/mihomo";
      ExecReload = "/run/current-system/sw/bin/sleep -HUP $MAINPID";
    };
  };
}
