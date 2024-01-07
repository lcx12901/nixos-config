{ config, pkgs, username, useremail, ... }: {
  services.pgadmin = {
    enable = true;
    initialEmail = useremail;
    initialPasswordFile = config.age.secrets."pgadmin.passwdFile".path;
  };

  networking.firewall.allowedTCPPorts = [ 5432 ];

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    authentication = ''
      #type database DBuser origin-address auth-method
      host  all      all     192.168.31.0/24   trust
      host all       all     ::1/128        trust
    '';
  };
}