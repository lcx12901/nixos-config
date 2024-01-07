{ config, lib, ... }: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "wktl1991504424@gmail.com";
    certs."nezuko.lincx.top" = {
      domain = "*.nezuko.lincx.top";
      group = "nginx";
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
      credentialsFile = config.age.secrets."cloudflareGlobalAPIKey.age".path;
    };
  };

  users.users.nginx.extraGroups = [ "acme" ];

  services.nginx = {
    enable = true;
    defaultHTTPListenPort = 404;
    defaultSSLListenPort = 302;

    # Use recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts =
    let
      base = locations: {
        inherit locations;
        forceSSL = true;
        sslCertificate = "/var/lib/acme/nezuko.lincx.top/cert.pem";
        sslCertificateKey = "/var/lib/acme/nezuko.lincx.top/key.pem";
      };
      proxy = port: base {
        "/".proxyPass = "http://127.0.0.1:" + toString(port);
      };
    in {
      "pgadmin.nezuko.lincx.top" = proxy 5050 // {
        extraConfig = ''
          proxy_set_header Referer "http://127.0.0.1"
        '';
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 302 404 ];
}