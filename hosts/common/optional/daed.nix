{ daeuniverse, ... }: {
  services.daed = {
    enable = true;
    configDir = "/etc/daed";
    listen = "::2023";
    openFirewall = {
      enable = true;
      port = 12345;
    };
  };

  environment.systemPackages =
  with daeuniverse.packages.x86_64-linux;
    [ daed ];
}