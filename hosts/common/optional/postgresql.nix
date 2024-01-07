{ config, pkgs, username, useremail, ... }: {
  services.pgadmin = {
    enable = true;
    openFirewall = true;
    initialEmail = useremail;
    initialPasswordFile = config.age.secrets."pgadmin.passwdFile".path;
  };

  networking.firewall.allowedTCPPorts = [ 5432 ];
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    authentication = ''
      #type database DBuser origin-address auth-method
      host postgres postgres 0.0.0.0/0 md5
      host postgres postgres ::/0 md5
    '';
  };
}