{
  config,
  lib,
  username,
  ...
}: let
  hasOptinPersistence = config.environment ? "persistence";
  volumesRoot = "${lib.optionalString hasOptinPersistence "/persistent"}/home/${username}/.containers";
in {
  virtualisation.oci-containers.containers = {
    ddns-go = {
      image = "jeessy/ddns-go:latest";
      autoStart = true;
      volumes = ["${volumesRoot}/ddns-go:/root"];
      extraOptions = ["--network=host" "--pull=newer"];
    };

    pgadmin = {
      image = "dpage/pgadmin4:latest";
      ports = ["5050:80"];
      extraOptions = ["--pull=newer"];
      environmentFiles = [config.age.secrets."pgadmin.envFile".path];
    };

    phpmyadmin = {
      image = "phpmyadmin:latest";
      ports = ["8080:80"];
      environment = {
        PMA_ARBITRARY = "1";
      };
      extraOptions = ["--pull=newer"];
    };

    aria2-pro = {
      image = "p3terx/aria2-pro:latest";
      autoStart = true;
      environmentFiles = [config.age.secrets."aria2.envFile".path];
      volumes = [
        "${volumesRoot}/aria2/config:/config"
        "${volumesRoot}/aria2/download:/downloads"
      ];
      environment = {
        IPV6_MODE = "true";
      };
      extraOptions = ["--network=host" "--log-opt=max-size=1m" "--pull=newer"];
    };
    ariang = {
      image = "p3terx/ariang:latest";
      autoStart = true;
      extraOptions = ["--network=host" "--log-opt=max-size=1m" "--pull=newer"];
    };
  };
}
