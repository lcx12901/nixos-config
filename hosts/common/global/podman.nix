{ lib, config, username, ... }:
let
  dockerEnabled = config.virtualisation.docker.enable;
  hasOptinPersistence = config.environment ? "persistence";
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
      volumes = [ "${lib.optionalString hasOptinPersistence "/persistent"}/home/${username}/.containers/ddns-go:/root" ];
      extraOptions = [ "--network=host" "--pull=newer" ];
    };
  };
}