{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    sing-box
  ];

  services.sing-box = {
    enable = true;
    settings = {
      experimental = {
        cache_file = {
          enabled = true;
          store_fakeip = false;
        };
        clash_api = {
          external_controller = "127.0.0.1:9090";
          external_ui = "ui";
          secret = builtins.readFile config.age.secrets."sing-box.secret".path;
          default_mode = "rule";
        };
      };
      dns = {
        servers = [
          {
            tag = "dns_proxy";
            address = "https://1.1.1.1/dns-query";
            address_resolver = "dns_resolver";
            strategy = "ipv4_only";
            detour = "proxy";
          }
          {
            tag = "dns_direct";
            address = "https://dns.alidns.com/dns-query";
            address_resolver = "dns_resolver";
            strategy = "ipv4_only";
            detour = "direct";
          }
          {
            tag = "dns_block";
            address = "rcode://success";
          }
          {
            tag = "dns_resolver";
            address = "223.5.5.5";
            strategy = "ipv4_only";
            detour = "direct";
          }
        ];
        rules = [
          {
            outbound = "any";
            server = "dns_resolver";
          }
          {
            rule_set = "geosite-geolocation-!cn";
            server = "dns_proxy";
          }
        ];
        final = "dns_direct";
      };
      route = {
        rule_set = [
          {
            tag = "geosite-geolocation-!cn";
            type = "remote";
            format = "binary";
            url = "https://raw.githubusercontent.com/SagerNet/sing-geosite/rule-set/geosite-geolocation-!cn.srs";
            download_detour = "proxy";
          }
          {
            tag = "geoip-cn";
            type = "remote";
            format = "binary";
            url = "https://raw.githubusercontent.com/SagerNet/sing-geoip/rule-set/geoip-cn.srs";
            download_detour = "proxy";
          }
        ];
        rules = [
          {
            protocol = "dns";
            outbound = "dns-out";
          }
          {
            type = "logical";
            mode = "and";
            rules = [
              {
                rule_set = "geoip-cn";
                invert = true;
              }
              {
                rule_set = "geosite-geolocation-!cn";
              }
            ];
            outbound = "proxy";
          }
          {
            rule_set = "geoip-cn";
            outbound = "direct";
          }
          {
            ip_is_private = true;
            outbound = "direct";
          }
        ];
        final = "proxy";
        auto_detect_interface = true;
      };
      inbounds = [
        {
          type = "tun";
          tag = "tun-in";
          inet4_address = "172.16.0.1/30";
          inet6_address = "fd00::1/126";
          mtu = 1492;
          auto_route = true;
          strict_route = true;
          stack = "system";
          sniff = true;
          sniff_override_destination = false;
        }
      ];
      outbounds = [
        {
          type = "vless";
          server = builtins.readFile config.age.secrets."sing-box.server".path;
          server_port = builtins.readFile config.age.secrets."sing-box.server-port".path;
          uuid = builtins.readFile config.age.secrets."sing-box.uuid".path;
          flow = "xtls-rprx-vision";
          tls = {
            enabled = true;
            server_name = builtins.readFile config.age.secrets."sing-box.server".path;
            utls = {
              enabled = true;
              fingerprint = "chrome";
            };
            reality = {
              enabled = true;
              public_key = builtins.readFile config.age.secrets."sing-box.public-key".path;
              short_id = builtins.readFile config.age.secrets."sing-box.short-id".path;
            };
          };
          packet_encoding = "xudp";
          tag = "proxy";
        }
        {
          type = "direct";
          tag = "direct";
        }
        {
          type = "block";
          tag = "block";
        }
        {
          type = "dns";
          tag = "dns-out";
        }
      ];
    };
  };
}