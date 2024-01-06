{ pkgs, ...}: {

  environment.systemPackages = with pkgs; [
    dae
  ];
  services.dae = {
    enable = true;
    disableTxChecksumIpGeneric = false;
    configFile = "/etc/dae/config.dae";
    assets = with pkgs; [ v2ray-geoip v2ray-domain-list-community ];
    openFirewall = {
      enable = true;
      port = 12345;
    };
  };
}