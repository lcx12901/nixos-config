{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    sing-box
  ];

  services.sing-box = {
    enable = true;
    settings = config.age.secrets."cing-box.config.dae".path;
  };
}