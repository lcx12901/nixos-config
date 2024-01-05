{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    sing-box
  ];

  services.sing-box = {
    enable = true;
    settings = builtins.readFile config.age.secrets.sing-box-config.path;
  };
}