{ config, pkgs, username, useremail, ... }: {
  networking.firewall.allowedTCPPorts = [ 5432 ];

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    authentication = ''
      #type database DBuser origin-address auth-method
      host  all      all     192.168.31.0/24   trust
      host  all      all     10.88.0.1/16   trust
      host all       all     ::1/128        trust
    '';
  };
}
