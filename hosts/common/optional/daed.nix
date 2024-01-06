{ pkgs, daeuniverse, ... }: {
  environment.systemPackages =
  with daeuniverse.packages.x86_64-linux;
    [ daed ];

  environment.systemPackages = with pkgs; [ 
    v2ray-geoip 
    v2ray-domain-list-community 
  ];

  services.daed = {
      enable = true;
      configDir = "/etc/daed";
      listen = "0.0.0.0:2023";
      openFirewall = {
        enable = true;
        port = 2023;
      };
  };
}