{
  pkgs,
  config,
  ...
}: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
