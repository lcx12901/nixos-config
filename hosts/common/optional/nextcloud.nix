{
  config,
  pkgs,
  username,
  ...
}: {
  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.nezuko.lincx.top";
    https = true;
    configureRedis = true;
    package = pkgs.nextcloud29;
    settings = {
      enabledPreviewProviders = [
        "OC\\Preview\\BMP"
        "OC\\Preview\\GIF"
        "OC\\Preview\\JPEG"
        "OC\\Preview\\Krita"
        "OC\\Preview\\MarkDown"
        "OC\\Preview\\MP3"
        "OC\\Preview\\OpenDocument"
        "OC\\Preview\\PNG"
        "OC\\Preview\\TXT"
        "OC\\Preview\\XBitmap"
        "OC\\Preview\\HEIC"
        "OC\\Preview\\Movie"
        "OC\\Preview\\MKV"
        "OC\\Preview\\MP4"
        "OC\\Preview\\AVI"
      ];
      log_type = "file";
    };
    database.createLocally = true;
    config = {
      dbtype = "pgsql";
      adminuser = username;
      adminpassFile = config.age.secrets."nextcloud.pwd".path;
    };
    maxUploadSize = "10G";
  };
}
