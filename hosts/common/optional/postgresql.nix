{ config, pkgs, username, useremail, ... }: {
  services.pgadmin = {
    enable = true;
    openFirewall = true;
    initialEmail = useremail;
    initialPasswordFile = config.age.secrets."pgadmin.passwdFile".path;
  };

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    ensureUsers = [
      { name = username; }
    ];
    ensureDatabases = [ "mydatabase" ];
    initialScript = pkgs.writeText "backend-initScript" ''
      alter user wktl superuser createrole createdb replication;
    '';
  };
}