{ config, pkgs, username, useremail, ... }: {

  networking.firewall.allowedTCPPorts = [ 5432 ];

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    authentication = ''
      #type database DBuser origin-address auth-method
      host  all      all     127.0.0.1/32   trust
      host all       all     ::1/128        trust
    '';
  };
}