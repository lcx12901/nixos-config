{
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    mpc-cli
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "/home/${username}/Music";
    user = username;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "pipewire boi"
      }
    '';
    network.listenAddress = "any";
    startWhenNeeded = true;
  };

  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}
