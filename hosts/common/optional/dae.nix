{ config, daeuniverse, ... }: {
  services.dae = {
    enable = true;
    disableTxChecksumIpGeneric = false;
    configFile = config.age.secrets."dae.config.age".path;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };

  environment.systemPackages =
  with daeuniverse.packages.x86_64-linux;
    [ dae ];
}