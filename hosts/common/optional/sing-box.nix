{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    sing-box
  ];

  services.sing-box = {
    enable = true;
  };

  systemd.services.sing-box = {
    preStart = ''
    '';
    wantedBy = [ "multi-user.target" ];
  };
}