{
  lib,
  config,
  pkgs,
  agenix,
  mysecrets,
  username,
  ...
}:
let
  # `attrset ? attrpath`，返回 bool 值， 判断属性集中是否存在某个属性
  hasOptinPersistence = config.environment ? "persistence";
in {
  imports = [
    agenix.nixosModules.default
  ];

  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default
  ];

  age.identityPaths = [
    # optionalString true "some-string"
    # => "some-string"
    # optionalString false "some-string"
    # => ""
    "${lib.optionalString hasOptinPersistence "/persistent"}/home/${username}/.ssh/wktl"
  ];

  age.secrets = {
    "nextcloud.pwd" = {
      file = "${mysecrets}/nextcloud.age";
      mode = "0600";
      owner = username;
    };
    "cloudflareGlobalAPIKey.age" = {
      file = "${mysecrets}/cloudflareGlobalAPIKey.age";
      owner = username;
    };
    "sing-box-config" = {
      file = "${mysecrets}/sing-box.config.age";
      mode = "0600";
      owner = username;
    };
  };

  environment.etc = {
    "sing-box/config.json" = {
      source = age.secrets."sing-box-config".path;
    };
  };
}