{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    sing-box
  ];

  services.sing-box = {
    enable = true;
  };
}