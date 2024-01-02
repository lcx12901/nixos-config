{ config, ... }:
let
  dockerEnabled = config.virtualisation.docker.enable;
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
      extraOptions = [ "--network=host" ];
    };
  };
}