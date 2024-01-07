{ config, useremail, ... }: {
  services.pgadmin = {
    enable = true;
    openFirewall = true;
    initialEmail = useremail;
    initialPasswordFile = config.age.secrets."pgadmin.passwdFile".path;
  };

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
  };
}