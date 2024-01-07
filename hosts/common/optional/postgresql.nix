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
    ensureUsers = [
      { name = username; }
    ];
    ensureDatabases = [ "mydatabase" ];
  };
}