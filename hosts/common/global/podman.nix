{ lib, config, username, ... }:
let
  dockerEnabled = config.virtualisation.docker.enable;
  hasOptinPersistence = config.environment ? "persistence";
  volumesRoot = "${lib.optionalString hasOptinPersistence "/persistent"}/home/${username}/.containers";
in
{
  virtualisation.podman = {
    enable = true;
    dockerCompat = !dockerEnabled;
    dockerSocket.enable = !dockerEnabled;
    defaultNetwork.settings.dns_enabled = true;
  };

  virtualisation.oci-containers.backend = "podman";

  virtualisation.oci-containers.containers = {
    ddns-go = {
      image = "jeessy/ddns-go:latest";
      autoStart = true;
      volumes = [ "${volumesRoot}/ddns-go:/root" ];
      extraOptions = [ "--network=host" "--pull=newer" ];
    };
  };
}