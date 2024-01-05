{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    sing-box
  ];

  services.sing-box = {
    enable = true;
    setting = "${config.age.secrets.sing-box-config.path}";
  };
}