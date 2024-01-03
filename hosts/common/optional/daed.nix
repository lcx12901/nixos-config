{ daeuniverse, ... }: {
  services.daed = {
    enable = true;
    configDir = "/etc/daed";
    listen = "0.0.0.0:2023";
    openFirewall = {
      enable = true;
      port = 2023;
    };
  };

  environment.systemPackages =
  with daeuniverse.packages.x86_64-linux;
    [ daed ];
}