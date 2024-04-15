{pkgs, ...}: {
  systemd.services.frp = {
    wants = ["network-online.target"];
    after = ["network-online.target"];
    wantedBy = ["multi-user.target"];
    description = "A fast reverse proxy frp client";
    serviceConfig = {
      Type = "simple";
      Restart = "on-failure";
      RestartSec = 15;
      DynamicUser = true;
      ExecStart = "${pkgs.frp}/bin/frpc -c ${configFile}";
      PrivateDevices = true;
      ProtectHostname = true;
      ProtectClock = true;
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectKernelLogs = true;
      ProtectControlGroups = true;
      RestrictAddressFamilies = ["AF_INET" "AF_INET6" "AF_UNIX"];
      LockPersonality = true;
      MemoryDenyWriteExecute = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      PrivateMounts = true;
      SystemCallArchitectures = "native";
      SystemCallFilter = ["@system-service"];
    };
  };
}
