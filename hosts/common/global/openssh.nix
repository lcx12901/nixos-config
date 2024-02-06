{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      # Automatically remove stale sockets
      StreamLocalBindUnlink = "yes";
      # Allow forwarding ports to everywhere
      GatewayPorts = "clientspecified";
    };
  };

  # ssh-agent is used to pull my private secrets repo from github when depoloying my nixos config.
  programs.ssh.startAgent = true;
}
