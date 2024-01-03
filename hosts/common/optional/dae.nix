{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    dae
  ];

  services.dae = {
    enable = true;
    disableTxChecksumIpGeneric = false;
    configFile = config.age.secrets."config.dae".path;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };
}