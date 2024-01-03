{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    dae
  ];

  services.dae = {
    enable = true;
    disableTxChecksumIpGeneric = false;
    config = config.age.secrets."config.dae".path;
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
  };
}