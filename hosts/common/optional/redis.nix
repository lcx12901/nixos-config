{ config, ... }: {
  services.redis.servers."nextcloud" = {
    enable = true;
    requirePassFile = config.age.secrets."redis.nextcloud.passwd".path;
    appendOnly = true;
  };
}