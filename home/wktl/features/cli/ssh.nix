{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_isa";
        identitiesOnly = true;
      };
    };
    extraConfig = ''
      identitiesOnly yes
      AddKeysToAgent yes
    '';
  };
}
