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
  };
}