{ config, ... }: {
  services.redis.servers."nextcloud" = {
    enable = true;
    user = "nextcloud";
    requirePassFile = config.age.secrets."redis.nextcloud.passwd".path;
    appendOnly = true;
  };
}