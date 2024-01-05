{ pkgs, config, ... }:
let
  config = builtins.readFile config.age.secrets."sing-box-config".path;
in {

  environment.systemPackages = with pkgs; [
    sing-box
  ];

  services.sing-box = {
    enable = true;
    settings = config;
  };
}