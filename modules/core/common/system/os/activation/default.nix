{
  system.activationScripts = {
    root_ssh_config = let
      sshDir = "/home/wktl/.ssh";
    in {
      text = ''
        (
          # symlink root ssh config to ours so daemon can use our agent/keys/etc...
          mkdir -p /root/.ssh
          ln -sf ${sshDir}/config /root/.ssh/config
          ln -sf ${sshDir}/known_hosts /root/.ssh/known_hosts
        )
      '';
      deps = [];
    };
  };
}
