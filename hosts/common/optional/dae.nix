{ pkgs, daeuniverse, ... }: {
  services.dae = {
    enable = true;
    disableTxChecksumIpGeneric = false;
    configFile = "/etc/dae/config.dae";
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };

  environment.systemPackages =
  with daeuniverse.packages.x86_64-linux;
    [ dae ];
}