{ config, lib, username, ... }:
let
  hasOptinPersistence = config.environment ? "persistence";
  volumesRoot = "${lib.optionalString hasOptinPersistence "/persistent"}/home/${username}/.containers";
in {
  virtualisation.oci-containers.containers = {
    ddns-go = {
      image = "jeessy/ddns-go:latest";
      autoStart = true;
      volumes = [ "${volumesRoot}/ddns-go:/root" ];
      extraOptions = [ "--network=host" "--pull=newer" ];
    };

    pgadmin = {
      image = "dpage/pgadmin4:latest";
      port = [ "5050:80" ];
      extraOptions = [ "--pull=newer" ];
      environmentFiles = config.age.secrets."pgadmin.envFile".path;
    };
  };
}